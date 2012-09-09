class Destination < ActiveRecord::Base
  scope :countries, select: ['DISTINCT country', 'COUNT(*) AS cnt'], group: 'country', order: 'country ASC'
  
  self.per_page = 8
  
end