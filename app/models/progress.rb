class Progress < ActiveRecord::Base
  attr_accessible :progressable_id, :progressable_type, :user_id
end
