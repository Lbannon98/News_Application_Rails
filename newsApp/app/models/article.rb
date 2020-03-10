#require "singleton"

class Article < ApplicationRecord
  #include Singleton

  #attr_reader :editor_id
  #attr_accessor :headline, :body

  belongs_to :editor
  has_many :comments

  #def initialize(editor_id, headline, body, publishedArticle)
  #  @editor_id = editor_id
  #  @headline = headline
  #  @body = body
  #  @publishedArticle = publishedArticle
  #end
  #
  #def headline=(new_headline)
  #  @headline = new_headline
  #  @publishedArticle.update(self)
  #end

  def self.search(search)
    if search
      where(["headline LIKE ?", "%#{search}%"])
      where(["body LIKE ?", "%#{search}%"])
    else
      all
    end
  end

end

#class PublishedArticle
#
#  def update(changed_article)
#    puts "This article was updated#{changed_article.headline}"
#  end
#end
#
#publishedArticle = PublishedArticle.new
#lauren = Article.new(1)
#lauren.headline = "Fuck ya"

#instance1 = Article.instance
#instance2 = Article.instance
#
#puts instance1 == instance2