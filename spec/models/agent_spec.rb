require 'rails_helper'

RSpec.describe Agent, type: :model do
  describe 'validations' do
    %i[name company_name phone].each do |field|
      it { should validate_presence_of(field) }
    end

    %i[name company_name].each do |field|
      it { should validate_length_of(field).is_at_least(6).is_at_most(20) }
    end
  end
end
