# frozen_string_literal: true

class RealEstateObject < ApplicationRecord
  has_one :address, dependent: destroy
  belongs_to :category

  validates :title, :price, presence: true
end
