class Destination < ActiveRecord::Base
  scope :for_js, select: [:latitude, :longitude, :heading, :pitch, :zoom, :city, :state, :country], order: 'latitude DESC'
  
  self.per_page = 10
  
end