class CategoriesController < ApplicationController

  before_action :category, only: [:show, :edit, :update, :destroy]

  # ----------------------------------------------------------------------------
    def category
      @category ||= Category.find params[:id]
    end
    def category_params
      params.require(:category).permit([:title, :body, {tag_ids: []}])
    end
  # ----------------------------------------------------------------------------

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    # @category.user = current_user
    if @category.save
      redirect_to(categories_path, notice: "Category created!")
    else
      render :new
    end
  end
  #
  def show

  end

  def edit
    # redirect_to root_path, alert: "Access denied." unless can? :edit, @category
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "Category updated!"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category deleted successfully"
    redirect_to categories_path
  end

end
