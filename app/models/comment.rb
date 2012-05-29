class Comment < ActiveRecord::Base
  attr_accessible :comment_id, :lesson_id, :text, :user_id, :commentable_id, :commentable_type


  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable, :dependent => :destroy



  belongs_to :user

  has_many :ratings, :as => :ratable



end
