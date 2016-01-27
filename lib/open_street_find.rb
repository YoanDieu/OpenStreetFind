require "open_street_find/version"
require 'net/http'
module OpenStreetFind
  # Your code goes here...
  def self.find(query)
    uri = URI('http://nominatim.openstreetmap.org/search/')
    return Net::HTTP.get(uri + "q=" + query + "&" + "format=[json]")
  end
end
