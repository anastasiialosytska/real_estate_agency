# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RealEstateObject do
  describe 'validations' do
    %i[title price].each do |field|
      it { is_expected.to validate_presence_of(field) }
    end
  end

  describe 'relations' do
    it { is_expected.to have_many(:photo_attachments).dependent(:destroy) }
    it { is_expected.to have_one(:address).dependent(:destroy) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to accept_nested_attributes_for(:photo_attachments) }
  end
end
