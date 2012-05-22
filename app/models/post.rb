class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :attachments_attributes

  has_many :attachments, :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for :attachments, :allow_destroy => true
end
