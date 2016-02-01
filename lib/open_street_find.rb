require "open_street_find/version"
require 'net/http'
require 'open-uri'

module OpenStreetFind
  # Your code goes here...
  def self.find(query)

    query = URI::encode(query)
    p "Open Street Find looking for :" + query
    uri = URI.parse("http://nominatim.openstreetmap.org/search/?q=#{query}&format=json&addressdetails=1")
    result = JSON.parse(Net::HTTP.get(uri))
    p "Open Street Find result from nominatim API :" + result.to_s
    return result
  end

  def self.is_a_station?(query)
    query = URI::encode(query)
    p "Open Street Find looking for :" + query
    uri = URI.parse("http://nominatim.openstreetmap.org/search/?q=#{query}&format=json&addressdetails=1")
    result = JSON.parse(Net::HTTP.get(uri))
    is_a_station = false
    result.each do |obj|
      if obj['class'].include?("railsway") || obj['class'].include?("aeroway") || obj['type'].include?("station") || || obj['type'].include?("aerodrome")
        is_a_station = true
      end
    end
    return is_a_station
  end

  def self.geocode(query)
    query = URI::encode(query)
    uri = URI.parse("http://nominatim.openstreetmap.org/search/?q=#{query}&format=json&addressdetails=1&limit=1")
    result = JSON.parse(Net::HTTP.get(uri))
    geocode = {
      lat: result[0]['lat']
      lon: result[0]['lon']
    }
    return geocode
  end

  def self.find_by_structural(street, postalcode, city, country)
    p "Open Street Find strctural looking for : street=\"#{street}\" | postalcode=\"#{postalcode}\" | city=\"#{city}\" | country=\"#{country}\""
    uri = URI.parse("http://nominatim.openstreetmap.org/search/?street=#{street}&postalcode=#{postalcode}&city=#{city}&country=#{country}&format=json&addressdetails=1")
    result = JSON.parse(Net::HTTP.get(uri))
    return result
  end

  def self.find_by_geocode(lon, lat)
    uri = URI.parse("http://nominatim.openstreetmap.org/reverse?lon=#{lon}&lat=#{lat}&zoom=18&addressdetails=1&format=json")
    result = Net::HTTP.get(uri)
    return result
  end
end
