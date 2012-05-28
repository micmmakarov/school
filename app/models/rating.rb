class Rating < ActiveRecord::Base
  attr_accessible :ratable_id, :ratable_type, :user_id, :value

  belongs_to :ratable, :polymorphic => true
  belongs_to :user
end
