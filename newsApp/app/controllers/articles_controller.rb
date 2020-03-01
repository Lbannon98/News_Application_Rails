class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all

    if params[:search]
      @articles = Article.search(params[:search])
    end

    @articles.each do |article|

      @headline = article.headline
      @body = article.body

      @cleansedHeadline = ProfanityFilter.check(@headline.to_s)
      @cleansedBody = ProfanityFilter.check(@body.to_s)

      article.headline = @cleansedHeadline
      article.body = @cleansedBody

    end

  end

  # GET /articles/1
  # GET /articles/1.json
  def show

    @article = Article.find(params[:id])
    #@comment = @article.comments
    #@comment = @article.comments.find(params[:comment_id])

    @headline = @article.headline
    @body = @article.body

    #@content = @comment.content

    @cleansedHeadline = ProfanityFilter.check(@headline.to_s)
    @cleansedBody = ProfanityFilter.check(@body.to_s)

    #@cleansedContent = ProfanityFilter.check(@content.to_s)

    @article.headline = @cleansedHeadline
    @article.body = @cleansedBody

    #@comment.content = @cleansedContent

  end

  # GET /articles/new
  def new
    @article = Article.new

    @headlineInput = params[:headline]
    @bodyInput = params[:body]

    @headlineResult = ProfanityFilter.check(@headlineInput.to_s)
    @bodyResult =  ProfanityFilter.check(@bodyInput.to_s)

  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create

    @article = Article.new(article_params)
    @article.editor = current_editor

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:headline, :body)
    end

end
