require 'news-api'
require 'rubygems'
require 'httparty'
require 'json'
require 'open-uri'
require 'open_weather'

class CurrentsApi
  #include HTTParty
  #
  #base_uri "https://api.currentsapi.services/"
  #default_params :apiKey => 'RqckPhM1m8p3VbtFwxBfnYAjn6Zeoxtjqb6Ml4GUxZFbPiMn'
  #
  #def articles
  #  self.class.get('/v1/latest-news')
  #  #response.parsed_response
  #
  #end

  def getContent

    begin

    url = 'https://api.currentsapi.services?'\
      '/v1/latest-news&'\
       'apiKey=RqckPhM1m8p3VbtFwxBfnYAjn6Zeoxtjqb6Ml4GUxZFbPiMn'

    req = open(url)
    response_body = req.read
    puts "Currents API: #{response_body}"


    rescue JSON::ParserError, TypeError => e
      puts e
    end

  end

end

class NewsApi

  def getContent

    begin

      url = 'http://newsapi.org/v2/top-headlines?'\
      'country=ie&'\
      'apiKey=a28f25dce0fd4cdeb9513908b17f4d4c'
      req = open(url)
      response_body = req.read
      puts "NewsAPI: #{response_body}"

      articles = JSON.parse(response_body)

      puts articles.to_s

      #articles.each do |key, value|

        #if key == "articles"
        #  if key == "title" || key == "description" || key == "urlToImage"
        #    puts "bgtenoruwmc#{value}"
        #  end
        #  #puts "#{value}"
        #end

      #end

    rescue JSON::ParserError, TypeError => e
      puts e
    end
  end

end


currentsApi = CurrentsApi.new
 puts "Currents API: #{currentsApi.getContent}"

newsApi = NewsApi.new
result = newsApi.getContent

puts "Result: #{result}"