class ArticlesController < ApplicationController
	before_action :set_article, only:[:show, :edit, :update, :destroy]

def index
	@articles = Article.paginate(page: params[:page], per_page: 5).order("created_at DESC")
end

def new
	@article = Article.new
end

def create
	# debugger
	@article = Article.new(article_params)
	@article.user = User.first
	if @article.save
		flash[:success] = "Article Created"
		redirect_to article_path(@article)
	else
		render "new"
	end
end

def show
end

def edit
end

def update
	if @article.update(article_params)
		flash[:success] = "Article Updated"
		redirect_to article_path(@article)
	else
		render "edit"
	end
end

def destroy
	@article.destroy
	flash[:warning] = "Article Deleted"
	redirect_to articles_path
end


private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description)
	end

end