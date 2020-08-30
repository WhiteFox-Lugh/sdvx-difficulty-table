class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements, id: false, primary_key: [:userid, :tuneid] do |t|
      t.string :userid
      t.integer :tuneid
      t.integer :score, default: 0
      t.integer :medal, default: 0

      t.timestamps
    end
  end
end
