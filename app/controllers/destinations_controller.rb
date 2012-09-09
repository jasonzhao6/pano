class DestinationsController < ApplicationController
  
  def index
    @countries = Destination.countries
    @destinations = Destination.where(country: params[:country])
    @destinations = Destination if @destinations.length == 0
    @destinations = @destinations.paginate(page: params[:page]).order'country ASC, state ASC, city ASC'
  end
  
end