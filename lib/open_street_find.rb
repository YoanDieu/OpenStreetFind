require "open_street_find/version"
require 'net/http'
module OpenStreetFind
  # Your code goes here...
  def self.find(query)
    q = query.split(" ")
    query = q.join("+")
    p "Open Street Find looking for :" + query
    uri = URI.parse("http://nominatim.openstreetmap.org/search/?q=#{query}&format=json&addressdetails=1")
    result = Net::HTTP.get(uri)
    p "Open Street Find result from nominatim API :" + result.to_s
    return result
  end
end
