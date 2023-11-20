class CreatePhotoAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :photo_attachments do |t|
      t.string :photo
      t.references :real_estate_object, foreign_key: true

      t.timestamps
    end
  end
end
