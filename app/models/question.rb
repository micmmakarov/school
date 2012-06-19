class Question < ActiveRecord::Base
  attr_accessible :text, :data_type, :user_id, :title, :description

  belongs_to :user
  has_many :answers

end
