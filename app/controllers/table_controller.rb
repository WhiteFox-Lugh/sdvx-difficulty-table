class TableController < ApplicationController
  include SessionsHelper
  def index
  end

  def list
    @level = params[:lv].to_i
    if @level <= 17 || @level >= 21
      @level = 18
    end

    @tunes = Sdvx.where(level: @level)

    if logged_in?
      uid = @current_user.uid
      achieve_table = Achievement.where(userid: uid)
      @achieve_map = Hash.new

      achieve_table.each do |t|
        data = [t.score, t.medal]
        tuneid = t.tuneid
        @achieve_map.store(tuneid, data)
      end
    end
  end
end
