# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RealEstateObjectsController do
  describe '#index' do
    let!(:real_estate_objects) { create_list(:real_estate_object, 3) }

    before { get :index }

    it 'returns ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end

    it 'populates an array of all real etate objects' do
      expect(assigns(:real_estate_objects)).to match_array(real_estate_objects)
    end
  end

  describe '#show' do
    let(:real_estate_object) { create(:real_estate_object) }

    before { get :show, params: { id: real_estate_object } }

    it 'assigns the requested real_estate_object to @real_estate_object' do
      expect(assigns(:real_estate_object)).to eq real_estate_object
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end

    it 'has http status OK' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#new' do
    before { get :new }

    it 'assigns a new real_estate_object to @real_estate_object' do
      expect(assigns(:real_estate_object)).to be_a_new(RealEstateObject)
    end

    it 'assigns a new photo_attachment to @real_estate_object_attachment' do
      expect(assigns(:real_estate_object_attachment)).to be_a_new(PhotoAttachment)
    end

    it 'renders show view' do
      expect(response).to render_template :new
    end

    it 'has http status OK' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:create_request) { post :create, params: params }
    let(:category) { create(:category) }

    context 'when saves a new real_estate_object in the database and redirects to real_estate_object show view' do
      let(:params) { { real_estate_object: attributes_for(:real_estate_object, category_id: category.id) } }

      it { expect { create_request }.to change(RealEstateObject, :count).by(1) }

      it 'redirects to real_estate_object show view' do
        create_request
        expect(response).to redirect_to(real_estate_object_path(assigns(:real_estate_object)))
      end

      it 'has http status OK' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when doesnt save a new real_estate_object in the database and render new page' do
      let(:params) { { real_estate_object: attributes_for(:real_estate_object, :invalid, category_id: category.id) } }

      it { expect { create_request }.not_to change(RealEstateObject, :count) }

      it 'render new view' do
        create_request
        expect(response).to render_template :new
      end

      it 'has http status OK' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
