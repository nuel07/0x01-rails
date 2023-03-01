class ArticlesController < ApplicationController
  #adding authentication
  http_basic_authenticate_with name: "dhh", password: "secret",
  except: [:index, :show]
  #action to list all articles
  def index
    @articles = Article.all
  end

  #controller action to fetch article with given id
  def show
    @article = Article.find(params[:id])
  end

  #instantiating a new article but does not save it
  def new
    @article = Article.new
  end

  #instantiates a new article with values for the title 
  #and body and attempts to save it
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # updating an article
  # fetching the article to update
  def edit
    @article = Article.find(params[:id])
  end

  # updating the article
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # deleting an article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
