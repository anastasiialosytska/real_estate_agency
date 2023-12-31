# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:real_estate_objects).dependent(:destroy) }
  end
end
