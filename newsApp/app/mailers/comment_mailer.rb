class CommentMailer < ApplicationMailer

  def new_comment_email(editor, user, comment)
    @editor = editor
    @user = user
    @comment = comment
    mail(to: @editor, subject:'Someone has commented on your Article!')

  end

end