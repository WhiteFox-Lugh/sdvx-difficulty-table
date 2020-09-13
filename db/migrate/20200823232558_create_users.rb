class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, options: 'CHARSET=utf8mb4' do |t|
      t.string :uid
      t.string :nickname
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
