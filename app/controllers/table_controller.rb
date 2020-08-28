class TableController < ApplicationController
  include SessionsHelper
  def index
  end

  def list
    if !logged_in?
      redirect_to root_url
    end
    
    @level = params[:lv].to_i
    uid = @current_user.uid
    @tunes = Sdvx.where(level: @level)
    @achieves = Achievement.where(userid: uid)
  end
end
