class CreateTwitts < ActiveRecord::Migration[5.1]
  def change
    create_table :twitts do |t|
      t.integer :user_id
      t.text :body
      t.string :image

      t.timestamps null: false
    end
  end
end