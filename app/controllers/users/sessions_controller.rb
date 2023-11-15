# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def new
      super do
        @client = Client.new
        @agent = Agent.new
      end
    end
  end
end
