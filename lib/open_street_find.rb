require "open_street_find/version"
require 'net/http'
require 'open-uri'

module OpenStreetFind
  # Your code goes here...
  def self.uri(query)
     query = URI::encode(query)
     endpoint = ENV["NOMINATIM_ENDPOINT"] || "http://nominatim.openstreetmap.org/"
     URI.parse("#{endpoint}/search/?q=#{query}&format=json&addressdetails=1")
  end

  def self.find(query)
    p "Open Street Find looking for :" + query
    result = JSON.parse(Net::HTTP.get(uri(query)))
    p "Open Street Find result from API :" + result.to_s
    return result
  end

  def self.find_by_geocode(lon, lat)
    endpoint = ENV["NOMINATIM_ENDPOINT"] || "http://nominatim.openstreetmap.org/"
    uri = URI.parse("#{endpoint}/reverse?lon=#{lon}&lat=#{lat}&zoom=18&addressdetails=1&format=json")
    result = Net::HTTP.get(uri)
    return result
  end
end
