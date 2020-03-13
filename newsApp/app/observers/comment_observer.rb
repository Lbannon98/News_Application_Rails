class CommentObserver < ActiveRecord::Observer

  def after_create(comment)

    CommentMailer.new_comment_email(comment.user.email).deliver_now

    #CommentMailer.new_comment_email(comment.user.email).deliver_now

  end

end

#@editor, @comment.user, @content
