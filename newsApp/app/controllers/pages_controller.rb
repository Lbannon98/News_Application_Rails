require 'news-api'
require 'open-uri'

class PagesController < ApplicationController

  def index

    @topHeadlines = newsApiHeadlines()
    @everything = newsApiEverything()

  end

  def show

    @topHeadlines = newsApiHeadlines()
    @everything = newsApiEverything()

  end

  def newsApiHeadlines
    newsApi = News.new("a28f25dce0fd4cdeb9513908b17f4d4c")
    headlines = newsApi.get_top_headlines(country: 'ie')
  end

  def newsApiEverything

    newsApi = News.new("a28f25dce0fd4cdeb9513908b17f4d4c")
    everything = newsApi.get_everything(q: 'health',
                                        from: '2020-02-20',
                                        to: '2020-02-25')
  end

end
