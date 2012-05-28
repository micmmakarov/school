class RatingsController < ApplicationController

  before_filter :authenticate_user!

def vote
  obj = params[:obj]
  id = params[:id]
  value = params[:value]
  o = obj.constantize.find(id)
  puts "###"
  puts "###"
  puts "###"
  puts "Class: " + o.id.to_s
  puts "Value: " + value
  current_user.rate!(o, value.to_i)
  #current_user.rate!(obj, value)
  respond_to do |format|
    format.js { render :partial => "ratings/vote.js", :locals => {:obj => o} }
    format.html { redirect_to "home#index" }
  end
end

end