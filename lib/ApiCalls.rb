require 'news-api'
require 'rubygems'
require 'httparty'

class CurrentsApi
  include HTTParty

  base_uri "https://api.currentsapi.services/"
  default_params :apiKey => 'RqckPhM1m8p3VbtFwxBfnYAjn6Zeoxtjqb6Ml4GUxZFbPiMn'

  def articles
    self.class.get('/v1/latest-news')
  end

end

class NewsApi
  include HTTParty

  base_uri "http://newsapi.org/"
  default_params :apiKey => 'a28f25dce0fd4cdeb9513908b17f4d4c'

  def articles
    self.class.get('/v2/everything?q=sport')
  end

end

currentsApi = CurrentsApi.new
puts "Currents API: #{currentsApi.articles}"

newsApi = NewsApi.new
puts "News API: #{newsApi.articles}"