# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @real_estate_objects = RealEstateObject.all.decorate
  end
end
