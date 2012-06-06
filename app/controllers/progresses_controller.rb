class ProgressesController < ApplicationController
  before_filter :authenticate_user!

  def complete
    obj_class = params[:class]
    obj_id = params[:id]
    @obj = "#{obj_class.to_s}".constantize.find(obj_id)
    current_user.complete!(@obj)
    respond_to do |format|
      format.js
    end
  end
end
