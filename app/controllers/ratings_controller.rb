class RatingsController < ApplicationController

  before_filter :authenticate_user!

def vote
  obj = params[:obj]
  id = params[:id]
  value = params[:value]
  o = obj.constantize.find(id)
  current_user.rate!(o, value.to_i)
  respond_to do |format|
    format.js { render :partial => "ratings/vote.js", :locals => {:obj => o} }
    format.html { redirect_to "home#index" }
  end
end

end