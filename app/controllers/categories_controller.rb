class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_parmas)
    if @category.save
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end  
  end


  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category =Category.find(params[:id])
    if @category.update(category_parmas)
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @category =Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
   def category_parmas
    params.require(:category).permit(:category_name)
   end
end
