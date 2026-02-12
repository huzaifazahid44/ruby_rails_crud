class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      redirect_to @article
      # Successfully saved
    else
      # Save failed - show errors
      render plain: "Errors: #{@article.errors.full_messages.join(', ')}"
    end
  end
end
