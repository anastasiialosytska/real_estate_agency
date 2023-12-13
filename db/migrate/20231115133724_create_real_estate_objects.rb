class CreateRealEstateObjects < ActiveRecord::Migration[7.1]
  def change
    create_table :real_estate_objects do |t|
      t.string :title, null: false
      t.text :description
      t.float :area
      t.integer :rooms
      t.integer :floor
      t.decimal :price, null: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
