class HomeController < ApplicationController
  def index
    @courses = Course.all(:order => "created_at DESC")
    @posts = Post.all(:order => "created_at DESC", :limit => 4)
  end
  def about

  end
end
