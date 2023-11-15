class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :country, null: false
      t.string :region
      t.string :city, null: false
      t.string :district
      t.string :street
      t.integer :house_number
      t.references :real_estate_object, foreign_key: true

      t.timestamps
    end
  end
end
