class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to @article
    else
      render 'new'
    end

    # respond_to do |format|
    #   if @article.save
    #     format.html { redirect_to @article, notice: "Article was successfully created." }
    #     format.json { render :show, status: :created, location: @article }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to @article
    else
      render 'edit'
    end
    # respond_to do |format|
    #   if @article.update(article_params)
    #     format.html { redirect_to @article, notice: "Article was successfully updated." }
    #     format.json { render :show, status: :ok, location: @article }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully destroyed."
    redirect_to articles_path
    # respond_to do |format|
    #   format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description, category_ids: [])
    end

    def require_same_user
      if current_user != @article.user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own article"
        redirect_to @article
      end
    end
end
