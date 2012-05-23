class Lesson < ActiveRecord::Base
  attr_accessible :address, :course_id, :description, :text, :time, :title

  belongs_to :course
  has_many :homeworks
  has_many :attendances
  has_many :users, :through => :attendances
  has_many :comments
  has_many :ratings, :as => :ratable


end
