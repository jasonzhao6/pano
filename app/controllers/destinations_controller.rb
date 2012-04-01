class DestinationsController < ApplicationController
  
  def index
    @destinations = Destination.where(country: 'Italy').for_js.paginate(page: params[:page])
  end
  
end