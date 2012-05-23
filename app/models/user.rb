class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :subscribe

  has_many :posts
  has_many :attendances
  has_many :lessons, :through => :attendances

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


end
