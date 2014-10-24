class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to articles_path, notice: "Article created successfully!"
    else
      render "new"
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_path, notice: "Article updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Article deleted successfully"
  end

  private

  def article_params
    params.require(:article).permit(:url, :title, :description)
  end
end
