# frozen_string_literal: true

class RealEstateObject < ApplicationRecord
  has_one :address, dependent: :destroy
  belongs_to :category
  has_many_attached :images

  validates :title, :price, presence: true
end
