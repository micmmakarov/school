class Feed < ActiveRecord::Base
  attr_accessible :action, :user_id

  belongs_to :user

  def add(user, action, obj)
      a = "created" if action.to_s.downcase == "create"
      a = "updated" if action.to_s.downcase == "edited"
      a = "destroyed" if action.to_s.downcase == "destroyed"
      o = obj.class.to_s.downcase
      t = ""
      t = obj.text if obj.text.present?
      t = obj.title if obj.title.present?

      text = user.name.to_s + " " + a + " " + o + " (" + t + ")"
      user.feeds.create!(:action => text)
  end

end
