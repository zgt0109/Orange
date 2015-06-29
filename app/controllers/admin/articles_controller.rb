class Admin::ArticlesController < ApplicationController

  before_action :set_article, :only => [:edit, :destroy, :update]
 
  def index
  	@article=Article.all
  end

  def new
  	@article=Article.new
  end

  def show
  end

  def edit
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html{
          redirect_to admin_article_url(@article)
        }
        format.js
      else
        format.html {render :edit}
        format.js
      end
    end
  end

  def create
  	@article=Article.new(article_params)
  	respond_to do |format|
	  	if @article.save
	  		format.html{
	  		redirect_to admin_articles_path
	  		}
	  		format.js
	  	else
	  		format.html{render :new}
	  		format.js
	  	end
	  end  	
  end

  private

  def article_params
  	params.require(:article).permit(:name, :content)
  end

  def set_article
    @article=Article.find(params[:id])
  end

end


