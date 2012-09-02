class Notification < ActiveRecord::Base
  attr_accessible :lesson_id, :sent
  
  belongs_to :lesson
  
end
