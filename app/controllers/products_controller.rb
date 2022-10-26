class ProductsController < ApplicationController
  
    def index
        @product = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end


    def new
      @product = Product.new(category_id: params[:category_id])
    end
    
    def create
        @product =current_user.products.new(products_params)
        
        if @product.save
          UserMailer.welcome(current_user,@product).deliver_now 
          redirect_to root_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
      @product = Product.find(params[:id])
    end
  
    def update
      @product =current_user.products.find(params[:id])
  
      if @product.update(products_params)
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end


    def destroy
      @product =current_user.products.find(params[:id])
      @product.destroy
      redirect_to root_path
    end

    def sell
      @category = Category.all
    end

    def detail
      @product = Product.find(params[:id])
    end
    
  
  def accept
    if @product.accepted!
      @product = Product.find(@product.id)
      @product.status("accept")
    end
  end


  def reject

  end

  private
    def products_params
      params.require(:product).permit(:name, :detail, :price , :image , :status, :category_id)
    end

end
