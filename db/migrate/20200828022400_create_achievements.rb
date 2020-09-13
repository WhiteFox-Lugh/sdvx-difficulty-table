class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements, id: false, primary_key: [:userid, :tuneid], options: 'CHARSET=utf8mb4' do |t|
      t.string :userid, null: false
      t.integer :tuneid, null: false
      t.integer :score, default: 0
      t.integer :medal, default: 0

      t.timestamps
    end

    add_index :achievements, [ :userid, :tuneid ], unique: true
  end
end
