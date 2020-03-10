#class ArticleObserver < ActiveRecord::Observer
#
#  def after_create(article)
#    if article.created_at_changed?
#      #Notification.date_changed(article.created_at)
#    end
#  end
#
#end