require 'news-api'
require 'rubygems'
require 'httparty'
require 'json'
require 'open-uri'

class CurrentsApi
  include HTTParty

  base_uri "https://api.currentsapi.services/"
  default_params :apiKey => 'RqckPhM1m8p3VbtFwxBfnYAjn6Zeoxtjqb6Ml4GUxZFbPiMn'

  def articles
    self.class.get('/v1/latest-news')
    #response.parsed_response

  end

  #url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
  #response = HTTParty.get(url)
  #response.parsed_response

end

class NewsApi
  #include HTTParty

  #base_uri "http://newsapi.org/"
  #default_params :apiKey => 'a28f25dce0fd4cdeb9513908b17f4d4c'
  #
  #def articles
  #  self.class.get('/v2/everything?q=sport')
  #  #response.parsed_response
  #
  #end

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

      articles.each do |key, value|

        if key == "articles"
          if key == "title" || key == "description" || key == "urlToImage"
            puts "bgtenoruwmc#{value}"
          end
          #puts "#{value}"
        end

        #puts "The hash key is #{key} and the value is #{value}."
      end



      #for i in articles do
      #  title = articles['articles'][i]['title']
      #  puts "#{title}"
      #end



      #title = articles['articles'][0]['title']
      #description = articles['articles'][0]['description']
      #image = articles['articles'][0]['urlToImage']

      #puts "Title: #{title}"
      #puts "Description: #{description}"
      #puts "Image URL: #{image}"

    rescue JSON::ParserError, TypeError => e
      puts e
    end
  end

end

currentsApi = CurrentsApi.new
#puts response = currentsApi.articles
 puts "Currents API: #{currentsApi.articles}"

#responseNewsApi = NewsApi.new
#puts "News API: #{responseNewsApi.articles}"

newsApi = NewsApi.new
result = newsApi.getContent

puts "Result: #{result}"

#text = "Hello world"
#
#json = '{"fruits": [{"name": "Apple", "location": "Harbor"}, {"name": "Banana", "location": "Kitchen"}, {"name": "Mango", "location": "Bedroom"}]}'
#
#puts json.to_s
#
#fruits = JSON.parse(json)
#
#fruits.values.first.each { |hash|
#  puts "\n\n#{hash['name']}, #{hash['location']}"
#}

#json = responseNewsApi.articles
#puts json.to_s
#
#articles = JSON.parse(json)
#
#articles.values.first.each { |hash|
#  puts "\n\n#{hash['title']}"
#  #, #{hash['location']}
#}

#newsapi = News.new("a28f25dce0fd4cdeb9513908b17f4d4c")
#
## /v2/top-headlines
#top_headlines = newsapi.get_top_headlines(q: 'sport',
#                                          sources: 'bbc-news,the-verge',
#                                          category: 'business',
#                                          language: 'en',
#                                          country: 'uk')
#
#all_articles = newsapi.get_everything(q: 'bitcoin',
#                                      sources: 'bbc-news,the-verge',
#                                      domains: 'bbc.co.uk,techcrunch.com',
#                                      from: '2017-12-01',
#                                      to: '2017-12-12',
#                                      language: 'en',
#                                      sortBy: 'relevancy',
#                                      page: 2)
#
#puts all_articles.to_s

#def format_articles(articles)
#  articles.map do |article| # change each -> map
#    "\n\n#{ article['title'] }" # delete puts, [0]
#    #, #{ article['description'] }, #{ article['urlToImage'] }
#  end.join # change to_sentence -> join
#end



#begin
#  data = JSON.parse(responseNewsApi.articles)
#  puts "#{data["articles"]["title"]}"
#
#  #puts "#{title}"
#
#rescue JSON::ParserError, TypeError => e
#  puts e
#end
