class Destination < ActiveRecord::Base
  
  PER_PAGE = 10
  
  default_scope order: 'latitude DESC'
  scope :for_js, select: [:latitude, :longitude, :heading, :pitch, :zoom, :city, :state, :country]
  
end