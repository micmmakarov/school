class AttendancesController < ApplicationController

  def attend
    @lesson = Lesson.find(params[:id])
    if user_signed_in?
      current_user.attend!(@lesson)
    end

    respond_to do |format|
      format.js
      format.json
    end

  end

end
