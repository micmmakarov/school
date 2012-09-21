class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :subscribe, :provider, :uid
  
  has_many :posts
  has_many :comments
  has_many :attendances
  has_many :lessons, :through => :attendances
  has_many :feeds
  before_save :generate_unsubscribe_link
  has_many :questions
  has_many :answers

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create!(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    user
  end
  
  def generate_unsubscribe_link

    self.unsubscribe_link = (0...30).map{65.+(rand(25)).chr}.join

  end

  def homeworks
    self.lessons.map(&:homeworks).flatten
  end

  has_attached_file :pic, :styles => { :feed => "480x400>", :medium => "500x400#",:slide => "180x260#", :thumb => "150x100#" },
                    :storage => :s3,
                    :bucket => 'aweek1024',
                    :convert_options => { :thumb => "-quality 92" },
                    :s3_credentials => {
                        :access_key_id => 'AKIAI25BIECHIO4NCM3Q',
                        :secret_access_key => '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',
                    }
 # :s3_credentials => {
 #     :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
 #     :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
 # }

  def attend!(lesson)
    if attending?(lesson)
       self.attendances.find_by_lesson_id(lesson.id).destroy
    else
       self.attendances.create!(:lesson_id => lesson.id)
    end
  end

  def attending?(lesson)
    if self.attendances.find_by_lesson_id(lesson.id)
      "Attending"
    end
  end

  def rated?(ddd)
    a = ddd.ratings.where(:user_id => self.id)
    #a=self.ratings.where("#{ddd.class.to_s.downcase}_id" => ddd.id)
    if a.present?
      a[0].value
    end
  end

  def rate!(ddd, value)
    if value < 0
      value=-1
    else
      value=1
    end

    ddd.ratings.create!(:user_id => self.id, :value => value) if not rated?(ddd)

    if ddd.class.to_s.downcase=="comment"
      ddd.rating = ddd.rating.to_i + value
      ddd.save!
    end

    if ddd.class.to_s.downcase=="post"
      ddd.rating = ddd.rating.to_i + value
      ddd.save!
    end

  end


  def log(action, obj)
    a = action.to_s.downcase + "ed"
    a = "viewed" if action.to_s.downcase == "index"
    a = "viewed" if action.to_s.downcase == "show"
    a = "created" if action.to_s.downcase == "create"
    a = "updated" if action.to_s.downcase == "update"
    a = "created new" if action.to_s.downcase == "new"
    a = "destroyed" if action.to_s.downcase == "destroy"
    o = obj.class.to_s.downcase
    t = ""
    if o == "comment"
      t = obj.text.to_s
    else
      t = obj.title.to_s
    end

    text = self.name.to_s + " " + a + " " + o + " (" + t + ")"
    self.feeds.create!(:action => text)
  end

  def complete?(obj)
    if obj.progresses.find_by_user_id(self.id)
      "Completed"
    end
  end


  def complete!(obj)
    if complete?(obj)
      obj.progresses.find_by_user_id(self.id).destroy
    else
      obj.progresses.create!(:user_id => self.id)
    end
  end

  def answered?(q)
    if self.answers.find_by_question_id(q.id)
      "answer exists!"
    end
  end

  def question
    qs = Question.all
    qs.each do |q|
      if self.answered?(q)
      else
        return q
      end

    end
	return nil
  end
  


end
