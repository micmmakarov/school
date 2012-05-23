class HomeController < ApplicationController
  def index
    @courses = Course.all(:order => "created_at DESC")
    @posts = Post.all(:order => "created_at DESC", :limit => 4)
  end
  def about
  end

  def thumbs
    attachments = Attachment.all
    attachments.each do |attachment|
      puts "!!!"
      puts "!!!"
      puts "!!!"
      puts "Regeneration pics for " + attachment.id.to_s
      attachment.pic.reprocess!
    end
    render text: "OK!"
  end

end
