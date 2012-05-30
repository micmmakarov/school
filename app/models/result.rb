class Result < ActiveRecord::Base
  attr_accessible :good, :lesson_id

  belongs_to :lesson
  has_many :comments, :as => :commentable, :dependent => :destroy

end
