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

  def update
    if logged_in?
      uid = @current_user.uid
      tune_id_str = params[:tune_id]
      val = params[:val].to_i
      
      # score update
      if tune_id_str.start_with?("score_")
        tune_id = tune_id_str.delete_prefix("score_").to_i
        current_data = Achievement.find_by(userid: uid, tuneid: tune_id)
        new_score = val

        if current_data.nil?
          new_medal = if new_score == 6 then 4 else 0 end
          sql = <<-SQL
            INSERT INTO "achievements" ("userid", "tuneid", "score", "medal", "created_at", "updated_at")
            VALUES (:uid, :tid, :score, :medal, :t, :t)
          SQL
          ActiveRecord::Base.connection.execute(ActiveRecord::Base.send(
            :sanitize_sql_array,
            [
              sql,
              uid: uid,
              tid: tune_id,
              score: new_score,
              medal: new_medal,
              t: Time.zone.now
            ]
          ))

        else
          current_medal = current_data.medal
          new_medal = if new_score == 6 then 4 else current_medal end
          sql = <<-SQL
            UPDATE "achievements" SET "score" = :score, "medal" = :medal
          SQL
          ActiveRecord::Base.connection.execute(ActiveRecord::Base.send(
            :sanitize_sql_array,
            [
              sql,
              score: new_score,
              medal: new_medal 
            ]
          ))
        end
      
      # medal update
      elsif tune_id_str.start_with?("medal_")
        tune_id = tune_id_str.delete_prefix("medal_")
        current_data = Achievement.find_by(userid: uid, tuneid: tune_id)
        new_medal = val

        if current_data.nil?
          new_score = if new_medal == 4 then 6 else 0 end
          sql = <<-SQL
            INSERT INTO "achievements" ("userid", "tuneid", "score", "medal", "created_at", "updated_at")
            VALUES (:uid, :tid, :score, :medal, :t, :t)
          SQL
          ActiveRecord::Base.connection.execute(ActiveRecord::Base.send(
            :sanitize_sql_array,
            [
              sql,
              uid: uid,
              tid: tune_id,
              score: new_score,
              medal: new_medal,
              t: Time.zone.now
            ]
          ))

        else
          current_score = current_data.score
          new_score = if new_medal == 4 then 6 else current_score end
          sql = <<-SQL
            UPDATE "achievements" SET "score" = :score, "medal" = :medal
          SQL

          ActiveRecord::Base.connection.execute(ActiveRecord::Base.send(
            :sanitize_sql_array,
            [
              sql,
              score: new_score,
              medal: new_medal 
            ]
          ))
        end
      end
    end
  end

  private
    def item_params
      params.require(:item).permit(:score, :medal)
    end
end
