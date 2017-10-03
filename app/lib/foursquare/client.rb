require "httparty"
require "uri"
require_relative "venue"

module Foursquare

  class Client
    VENUE_URI = "https://api.foursquare.com/v2/venues/"

    def response_to_venues(response)
      response["response"]["groups"][0]["items"].map do |item|
        venue = Venue.new
        venue.fid = item["venue"]["id"]
        venue.name = item["venue"]["name"]
        venue.location = item["venue"]["location"]
        venue.rating = item["venue"]["rating"]
        venue.url = item["venue"]["url"]
        venue.hours = item["venue"]["url"]
        venue.photourl = item["tips"][0]["photourl"]
        venue.price = item["venue"]["price"]
        venue
      end
    end

    def top50(city, section)
      explore(
        city: city,
        limit: 50,
        section: section,
      )
    end

    def explore(city: "nyc", limit: 50, section: nil)
      response = get_explore(city: city, limit: limit, section: section)
      response_to_venues(response)
    end

    def get_explore(city:, limit:, section: nil)
      query = {}
      query[:near] = city
      query[:limit] = limit
      query[:section] = section if section


      authenticated_get(
        path: "explore",
        query: query
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
