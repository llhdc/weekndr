require "dotenv/load"
require "httparty"
require "uri"
require "pry"
require "byebug"

module Foursquare
  class Venue
    attr_accessor :fid, :name, :location
  end

  class Client
    VENUE_URI = "https://api.foursquare.com/v2/venues/"

    def response_to_venues(response)
      response["response"]["groups"][0]["items"].map do |item|
        venue = Venue.new
        venue.fid = item["venue"]["id"]
        venue.name = item["venue"]["name"]
        venue.location = item["venue"]["location"]
        venue
      end
    end

    def top50(city)
      explore(
        city: city,
        limit: 50
      )
    end

    def explore(city:, limit: 20)
      response = get_explore(city: city, limit: limit)
      response_to_venues(response)
    end

    def get_explore(city:, limit:)
      authenticated_get(
        path: "explore",
        query: {
          near: city,
          limit: limit
        }
      )
    end

    def authenticated_get(path: , query:)
      uri = URI.join(VENUE_URI, path)

      default_query = {
        client_id: ENV["CLIENT_ID"],
        client_secret: ENV["CLIENT_SECRET"],
        m: "foursquare",
        v: "20171001"
      }

      HTTParty.get(
        uri.to_s,
        query: default_query.merge(query)
      )
    end
  end
end

fs = Foursquare::Client.new
nyc_venues = fs.top50("nyc")
# nyc_venues.each do |venue|
#   puts venue.fid
#   puts venue.name
#   puts venue.location
#   puts
# end

venue = nyc_venues[10..-1].shuffle.first
puts venue.fid
puts venue.name
puts venue.location
puts
