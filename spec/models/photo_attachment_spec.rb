# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhotoAttachment do
  describe 'relations' do
    it { is_expected.to belong_to(:real_estate_object) }
  end
end
