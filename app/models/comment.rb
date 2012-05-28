class Comment < ActiveRecord::Base
  attr_accessible :comment_id, :lesson_id, :text, :user_id

  has_many :comments, :dependent => :destroy
  belongs_to :comment
  belongs_to :lesson
  belongs_to :user
  has_many :ratings, :as => :ratable

end
