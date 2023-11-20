# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :real_estate_object

  validates :country, :city, presence: true
end
