class RealEstateObjectDecorator < Draper::Decorator
  delegate_all

  def main_photo
    object.photo_attachments.first.photo.url(:thumb)
  end
end
