class CreateSdvxes < ActiveRecord::Migration[6.0]
  def change
    create_table :sdvxes, options: 'CHARSET=utf8mb4' do |t|
      t.string :title
      t.string :composer
      t.integer :level
      t.integer :chain
      t.string :jacket_img_url
      t.integer :version

      t.timestamps
    end
  end
end
