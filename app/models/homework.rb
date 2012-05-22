class Homework < ActiveRecord::Base
  attr_accessible :description, :lesson_id, :title

  belongs_to :lesson

end
