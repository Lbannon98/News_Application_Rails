require 'news-api'
require 'open-uri'
require 'open_weather'

class PagesController < ApplicationController
  before_action :set_breadcrumbs

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

  def reset
    reset_session
    @breadcrumbs = nil
  end

  private
  def set_breadcrumbs
    if session[:breadcrumbs]
      @breadcrumbs = session[:breadcrumbs]
    else
      @breadcrumbs = Array.new
    end

    @breadcrumbs.push(request.base_url)

    if @breadcrumbs.count > 1
      @breadcrumbs.shift
    end

    session[:breadcrumbs] = @breadcrumbs

  end



end
