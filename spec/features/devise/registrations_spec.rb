# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registration', js: true do
  describe '#new' do
    let(:password) { Faker::Internet.password }
    let(:email) { Faker::Internet.email }

    before { visit new_user_session_path }

    context 'when user tries to register like an agent' do
      let(:name) { Faker::Name.name }
      let(:company_name) { Faker::Lorem.characters(number: 10) }
      let(:phone) { Faker::PhoneNumber.phone_number }

      context 'with valid data' do
        before do
          within('#new_agent') do
            fill_in 'Name', with: name
            fill_in 'Email', with: email
            fill_in 'Phone', with: phone
            fill_in 'Company name', with: company_name
            fill_in 'Password', with: password
            fill_in 'Password confirmation', with: password
            click_on 'Become an agent'
          end
        end

        it { expect(page).to have_content I18n.t('devise.registrations.signed_up') }
        it { expect(page).to have_current_path(root_path) }
      end

      context 'with invalid data' do
        before do
          within('#new_agent') do
            fill_in 'Email', with: email
            fill_in 'Phone', with: phone
            fill_in 'Company name', with: company_name
            fill_in 'Password', with: password
            fill_in 'Password confirmation', with: password
            click_on 'Become an agent'
          end
        end

        it { expect(page).to have_content "Name can't be blank" }
        it { expect(page).to have_current_path(new_user_session_path) }
      end
    end

    context 'when user tries to register like a client' do
      context 'with valid data' do
        before do
          within('#new_client') do
            fill_in 'Email', with: email
            fill_in 'Password', with: password
            fill_in 'Password confirmation', with: password
            click_on 'Register'
          end
        end

        it { expect(page).to have_content I18n.t('devise.registrations.signed_up') }
        it { expect(page).to have_current_path(root_path) }
      end

      context 'with invalid data' do
        before do
          within('#new_client') do
            fill_in 'Password', with: password
            fill_in 'Password confirmation', with: password
            click_on 'Register'
          end
        end

        it { expect(page).to have_content "Email can't be blank" }
        it { expect(page).to have_current_path(new_user_session_path) }
      end
    end
  end
end
