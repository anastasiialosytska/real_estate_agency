# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address do
  describe 'validations' do
    %i[country city].each do |field|
      it { is_expected.to validate_presence_of(field) }
    end
  end

  describe 'relations' do
    it { is_expected.to belong_to(:real_estate_object) }
  end
end
