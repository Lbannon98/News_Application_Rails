require 'Subject.rb'
require 'observer'

class CommentsController < ApplicationController
  include Observable

  # GET /articles/1/comments
  def index

    @article = Article.find(params[:article_id])
    @comments = @article.comments

    @user = current_user

  end

  # GET /articles/1/comments/2
  def show

    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    #@article.add_observer(@comment)

  end

  # GET /articles/1/comments/new
  def new

    @article = Article.find(params[:article_id])
    @comment = @article.comments.build

  end

  # POST /articles/1/comments
  def create

    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    @comment.user = current_user

    if @comment.save
      # Save the review successfully
      redirect_to article_comments_url(@article, @comment)
    else
      render :action => "new"
    end
  end

  # GET /articles/1/comments/2/edit
  def edit

    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

  end

  # PUT /articles/1/comments/2
  def update

    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])

    changed
    notify_observers(self)

    if @comment.update(comment_params)
      # Save the review successfully
      redirect_to article_comment_url(@article, @comment)
    else
      render :action => "edit"
    end
  end

  # DELETE /articles/1/comments/2
  def destroy

    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_comments_path(@article), notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }

    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user)
  end

end

class Publisher
  def update(changed_comment)
    puts "You're comment has been updated to #{changed_comment.content}"
  end
end