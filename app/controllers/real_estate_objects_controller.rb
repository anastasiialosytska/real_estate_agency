# frozen_string_literal: true

class RealEstateObjectsController < ApplicationController
  before_action :find_real_estate_object, only: :show

  def index
    @real_estate_objects = RealEstateObject.all
  end

  def show; end

  def new
    @real_estate_object = RealEstateObject.new
    @real_estate_object_attachment = @real_estate_object.photo_attachments.build
  end

  def create
    @real_estate_object = RealEstateObject.create(real_estate_object_params)
    if @real_estate_object.save
      PhotoAttachmentCreatorService.call(photo_params, @real_estate_object.id)
      redirect_to @real_estate_object
    else
      render 'new'
    end
  end

  private

  def photo_params
    params[:photo_attachments] ? params[:photo_attachments]['photo'] : nil
  end

  def find_real_estate_object
    @real_estate_object = RealEstateObject.find(params[:id])
  end

  def real_estate_object_params
    params.require(:real_estate_object).permit(:category_id,
                                               :title,
                                               :description,
                                               :area, :rooms,
                                               :floor,
                                               :price,
                                               photo_attachments_attributes: %i[id real_estate_object_id photo])
  end
end
