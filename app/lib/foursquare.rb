require_relative "foursquare/client"

module Foursquare
end

# fs = Foursquare::Client.new
# # outdoors = fs.top50("nyc", "outdoors")
# night = fs.top50("nyc", "nightlife")
# eat = fs.top50("nyc", "food")
# arts = fs.top50("nyc", "arts")
# nyc_venues = fs.top50("nyc")
# # nyc_venues.each do |venue|
# #   puts venue.fid
# #   puts venue.name
# #   puts venue.location
# #   puts
# # end
#
# # venue = nyc_venues[10..-1].shuffle.first #Randomly produce venue in top 50 but not in the top 10
# # venue = arts.shuffle.first
# venue = night.shuffle.first
# puts venue.fid
# puts venue.name
# puts venue.location
# puts venue.rating
# puts venue.url
# puts venue.photourl
# puts venue.price
# puts
