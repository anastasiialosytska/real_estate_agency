# frozen_string_literal: true

class PhotoAttachmentCreatorService
  include Callable

  DEFAULT_PHOTO_PATH = 'app/assets/images/default_photo.png'

  def initialize(attached_photos, object_id)
    @attached_photos = attached_photos
    @object = RealEstateObject.find(object_id)
  end

  def call
    return upload_default_photo unless @attached_photos

    @attached_photos.each do |photo|
      @object.photo_attachments.create!(photo: photo, real_estate_object_id: @object.id)
    end
  end

  private

  def upload_default_photo
    @object.photo_attachments.create!(photo: File.open(DEFAULT_PHOTO_PATH), real_estate_object_id: @object.id)
  end
end
