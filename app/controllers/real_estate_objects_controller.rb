class RealEstateObjectsController < ApplicationController
  def index
    @real_estate_objects = RealEstateObject.all
  end

  def new
    @real_estate_object = RealEstateObject.new
  end

  def create
    @real_estate_object = RealEstateObject.create!(real_estate_object_params)
    @real_estate_object.images.attach(params[:images])
    if @real_estate_object.save
      redirect_to @real_estate_object
    else
      render "new"
    end
  end

  private

  def real_estate_object_params
    params.require(:real_estate_object).permit(:category_id, :title, :description, :area, :rooms, :floor, :price, images: [])
  end
end
