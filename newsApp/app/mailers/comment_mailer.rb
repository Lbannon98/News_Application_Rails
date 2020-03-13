class CommentMailer < ApplicationMailer

  def new_comment_email(editor)

    @editor = editor
    mail(to: @editor, subject:'Someone has commented on your Article!')

  end

end
#, user, comment

#@user = user
#@comment = comment