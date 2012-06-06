class Homework < ActiveRecord::Base
  attr_accessible :description, :lesson_id, :title

  belongs_to :lesson
  has_many :progresses, :as => :progressable, :dependent => :destroy
  has_many :comments, :as => :commentable, :dependent => :destroy

end
