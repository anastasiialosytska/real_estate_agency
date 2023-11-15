# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      super do |user|
        unless user.persisted?
          redirect_back(fallback_location: root_path, notice: user.errors.full_messages.to_sentence)
          return
        end
      end
    end
  end
end
