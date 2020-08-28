class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements, id: false, primary_key: [:userid, :tuneid] do |t|
      t.integer :userid
      t.integer :tuneid
      t.integer :score
      t.integer :medal

      t.timestamps
    end
  end
end
