# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController do
  describe '#home' do
    let!(:real_estate_objects) { create_list(:real_estate_object, 3) }

    before { get :home }

    it 'returns ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders home template' do
      expect(response).to render_template(:home)
    end

    it 'populates an array of all real etate objects' do
      expect(assigns(:real_estate_objects)).to match_array(real_estate_objects)
    end
  end
end
