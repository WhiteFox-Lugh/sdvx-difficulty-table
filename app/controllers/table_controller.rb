class TableController < ApplicationController
  def index
  end

  def list
    @level = params[:lv].to_i
    @tunes = Sdvx.where(level: @level)
  end
end
