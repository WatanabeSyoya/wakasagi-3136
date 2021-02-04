class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,                 null: false
      t.text :post_text,               null: false
      t.integer :fishing_result,       null: false
      t.integer :place_id,             null: false
      t.integer :water_depth_id,       null: false
      t.integer :weather_id,           null: false
      t.integer :feed_id,              null: false
      t.references :user,              foreign_key: true
      t.timestamps
    end
  end
end
