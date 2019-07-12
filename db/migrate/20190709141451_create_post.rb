class CreatePost < ActiveRecord::Migration[5.2]
    def change
      create_table :post do |t|
        t.string :name
        t.string :image_url
        t.string :description
        t.string :category
        t.integer :user_id
        t.datetime :created_at , null: false
        t.datetime :updated_at , null: false
    end
  end
end
