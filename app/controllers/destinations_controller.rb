class DestinationsController < ApplicationController
  
  def index
    @destinations = Destination.where(country: 'Italy').for_js.limit(Destination::PER_PAGE)
  end
  
end