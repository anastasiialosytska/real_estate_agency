# frozen_string_literal: true

class RealEstateObject < ApplicationRecord
  has_one :address, dependent: :destroy
  belongs_to :category
  has_many :photo_attachments, dependent: :destroy
  accepts_nested_attributes_for :photo_attachments

  validates :title, :price, presence: true
end
