class EventsController < ApplicationController
  def show
  end

  def new
  end

  def create
  end

  def event
    fs = Foursquare::Client.new
    @night = fs.top50("nyc," "nightlife")
    @eat = fs.top50("nyc", "food")
    @art = fs.top50("nyc", "arts")
  end
  
end
