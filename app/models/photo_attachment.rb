# frozen_string_literal: true

class PhotoAttachment < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :real_estate_object
end
