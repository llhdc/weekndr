require 'dotenv/load'
require 'pry'
require 'byebug'
require 'httparty'

class FoursquareSearch
  FOURSQUARE_API_URL="https://api.foursquare.com/v2/venues/"

  def get_top10_recommended_venues
    url = "#{FOURSQUARE_API_URL}/explore?near=dc&limit=10"
    response = authenticated_get(url)
  end

  def authenticated_get(url)
     HTTParty.get(
       url,
       query: {
         :client_id => ENV["CLIENT_ID"],
         :client_secret => ENV["CLIENT_SECRET"],
         :v => '20170609',
         :m => 'foursquare'
       }
     )
  end

end

fs = FoursquareSearch.new
venues = fs.get_top10_recommended_venues
