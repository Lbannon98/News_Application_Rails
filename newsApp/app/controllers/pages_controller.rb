require 'news-api'
require 'open-uri'
require 'open_weather'

class PagesController < ApplicationController

  def index

    @topHeadlines = newsApiHeadlines()
    @weather = weatherApi()

  end

  def newsApiHeadlines

    newsApi = News.new("a28f25dce0fd4cdeb9513908b17f4d4c")
    headlines = newsApi.get_top_headlines(country: 'ie')

  end

  def weatherApi

    options = { units: "metric", APPID: "e70cadf7fe0bb13f9ba7f1f1ead47aff" }
    request = OpenWeather::Current.city("Dublin, IE", options)

    temp = request['main']['temp']

  end

end
