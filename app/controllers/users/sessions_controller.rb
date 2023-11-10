# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new
    super do
      @client = Client.new
      @agent = Agent.new
    end
  end
end
