class Event < ActiveRecord::Base
  attr_accessible :address, :description, :e_id, :fee, :group, :lat, :lon, :photo, :time, :title, :url

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :ratings, :as => :ratable

end
