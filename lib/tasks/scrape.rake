# encoding: utf-8

namespace :scrape do

  task :mapcrunch => :environment do
    agent = Mechanize.new
    page = agent.get 'http://www.mapcrunch.com/gallery'
    
    begin
      # the data we are looking for is a JSON string assigned to a variable inside a script tag
      script = page.search('script').select{|s| s.text =~ /pano/}.first.text
      # strip everything before the JSON string
      script.gsub! /(.|\n)+var pics = '/, ''
      # strip everything after the JSON string
      script.gsub! /';(\n)+/, ''
      
      destinations = JSON.parse script
      destinations.each do |d|
        # original data
        urlstring = d['urlstring']
        panoid = d['panoid']
        location = d['location']
        
        # massaged data
        entry = {}
        entry['latitude'], entry['longitude'], entry['heading'], entry['pitch'], entry['zoom'] = urlstring.split('_').map{|s| s.to_f}
        entry['pano_id'] = panoid
        entry['city'], entry['state'], entry['country'] = location.split(', ').unshift('')[-3..-1]
        
        # insert if has country and does not already exist
        unless entry['country'].blank? || Destination.find_by_pano_id panoid
          p Destination.create entry
        end
      end
    end while page = page.link_with(text: 'Next »').try(:click)
      
  end

end