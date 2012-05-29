class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :attachments_attributes

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :attachments, :dependent => :destroy
  belongs_to :user
  has_many :ratings, :as => :ratable
  has_many :comments, :as => :commentable, :dependent => :destroy


  accepts_nested_attributes_for :attachments, :allow_destroy => true
end
