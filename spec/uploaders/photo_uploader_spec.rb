# frozen_string_literal: true

require 'rails_helper'

describe PhotoUploader do
  include CarrierWave::Test::Matchers

  let(:real_estate_object) { build(:real_estate_object) }
  let(:path) { Rails.root.join('app/assets/images/default_photo.jpg') }
  let(:uploader) { described_class.new(real_estate_object, :photo) }

  after do
    described_class.enable_processing = false
    uploader.remove!
  end

  context 'when stores real estate object photo avatar' do
    before do
      described_class.enable_processing = true
      File.open(path) { |f| uploader.store!(f) }
    end

    it 'scales down a photo to be exactly 200 by 200 pixels' do
      expect(uploader.thumb).to have_dimensions(200, 200)
    end
  end
end
