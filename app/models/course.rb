class Course < ActiveRecord::Base
  attr_accessible :description, :text, :title

  has_many :lessons

end
