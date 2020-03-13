class UserObserver < ActiveRecord::Observer

  def after_create(user)

    @user = user.email

    UserMailer.welcome_email(@user).deliver_now

    #@user = comment.user.email
    #@editor = comment.article.editor.email
    #@content = comment.content
    #
    #CommentMailer.new_comment_email(@editor, @user, @content).deliver_now

  end

end