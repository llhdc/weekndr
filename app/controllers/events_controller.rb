class EventsController < ApplicationController
  def show
  end

  def new_event
    fs = Foursquare::Client.new
    @venues =
      case params[:type]
      when "night" then fs.top50("nyc", "nightlife")
      when "food"  then fs.top50("nyc", "food")
      when "art"   then fs.top50("nyc", "arts")
      else fs.top50("nyc", nil)
      end
    @venue = @venues.shuffle.first
  end

end
