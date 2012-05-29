class Course < ActiveRecord::Base
  attr_accessible :description, :text, :title

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :lessons
  has_many :ratings, :as => :ratable
  has_many :comments, :as => :commentable, :dependent => :destroy

end
