require "open_street_find/version"
require 'net/http'
module OpenStreetFind
  # Your code goes here...
  def self.find(query)
    q = query.split(" ")
    query = q.join("+")
    p "Open Street Find looking for :" + query
    uri = URI.parse("http://nominatim.openstreetmap.org/search/?q=#{query}&format=json&addressdetails=1")
    result = JSON.parse(Net::HTTP.get(uri))
    p "Open Street Find result from nominatim API :" + result.to_s
    return result
  end

  def self.structural_find(street, postalcode, city, country)
    p "Open Street Find strctural looking for : street=\"#{street}\" | postalcode=\"#{postalcode}\" | city=\"#{city}\" | country=\"#{country}\""
    uri = URI.parse("http://nominatim.openstreetmap.org/search/?street=#{street}&postalcode=#{{postalcode}}&city=#{city}&country=#{country}&format=json&addressdetails=1")
    result = JSON.parse(Net::HTTP.get(uri))
    return result
  end
end
