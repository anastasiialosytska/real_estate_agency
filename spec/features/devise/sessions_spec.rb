# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session', js: true do
  describe '#new' do
    before { visit new_user_session_path }

    context 'when client tries to log in' do
      let(:client) { create(:client) }

      context 'with valid data' do
        before do
          within('#new_user') do
            fill_in 'Email', with: client.email
            fill_in 'Password', with: client.password
            click_on 'Log in'
          end
        end

        it { expect(page).to have_content 'Signed in successfully' }
        it { expect(page).to have_current_path(root_path) }
      end

      context 'with invalid data' do
        before do
          within('#new_user') do
            fill_in 'Email', with: Faker::Internet.email
            fill_in 'Password', with: client.password
            click_on 'Log in'
          end
        end

        it { expect(page).to have_content 'Invalid Email or password' }
        it { expect(page).to have_current_path(new_user_session_path) }
      end
    end

    context 'when agent tries to log in' do
      let(:agent) { create(:agent) }

      context 'with valid data' do
        before do
          within('#new_user') do
            fill_in 'Email', with: agent.email
            fill_in 'Password', with: agent.password
            click_on 'Log in'
          end
        end

        it { expect(page).to have_content 'Signed in successfully' }
        it { expect(page).to have_current_path(root_path) }
      end

      context 'with invalid data' do
        before do
          within('#new_user') do
            fill_in 'Email', with: Faker::Internet.email
            fill_in 'Password', with: agent.password
            click_on 'Log in'
          end
        end

        it { expect(page).to have_content 'Invalid Email or password' }
        it { expect(page).to have_current_path(new_user_session_path) }
      end
    end
  end
end
