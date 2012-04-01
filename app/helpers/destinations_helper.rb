module DestinationsHelper
  
  def destinations
    @destinations.map{|d| d.to_json}.to_s.gsub(/\\"/, '"').gsub(/"{/, '{').gsub(/}"/, '}')
  end
  
end