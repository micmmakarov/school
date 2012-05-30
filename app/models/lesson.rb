class Lesson < ActiveRecord::Base
  attr_accessible :address, :course_id, :description, :text, :time, :title

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :results
  belongs_to :course
  has_many :homeworks
  has_many :attendances
  has_many :users, :through => :attendances
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :ratings, :as => :ratable

  def attendance
    self.attendances.length
  end

end
