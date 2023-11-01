# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new
    @client = Client.new
    @agent = Agent.new
    super
  end
end
