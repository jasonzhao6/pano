class DestinationsController < ApplicationController
  
  def index
    @destinations = Destination.where(country: 'Italy').for_js.limit(10)
  end
  
end