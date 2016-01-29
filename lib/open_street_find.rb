require "open_street_find/version"
require 'net/http'
module OpenStreetFind
  # Your code goes here...
  def self.find(query)
    q = query.split(" ")
    query = q.join("+")
    uri = URI.parse("http://nominatim.openstreetmap.org/search/q=#{query}&format=[json]")
    return Net::HTTP.get(uri)
  end
end
