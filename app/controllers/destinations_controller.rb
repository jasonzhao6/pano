class DestinationsController < ApplicationController
  
  def index
    @countries = Destination.countries
    @destinations = Destination.where(country: 'Italy').paginate(page: params[:page])
  end
  
end