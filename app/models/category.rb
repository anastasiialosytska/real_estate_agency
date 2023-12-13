# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :real_estate_objects, dependent: :destroy

  validates :title, presence: true
end
