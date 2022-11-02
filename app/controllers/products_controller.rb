class ProductsController < ApplicationController
  before_action :authenticate_user!

    def index
        @product = Product.where(status:"accepted").page(params[:page]).per(12)
    end
    
    def productname
      @product = Product.all
    end


    def search
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
    
      
    def pending
      @product = Product.where(status:"pending")
    end

    def accept
      @product = Product.where(status:"accepted")
      if params[:product_id].present?
        @product = Product.find(params[:product_id])
        if @product.update(status:"accepted")
          redirect_to @product
        end
      end
    end


    def reject
      @product = Product.where(status:"rejected")
      if params[:product_id].present?
        @product = Product.find(params[:product_id])
        if @product.update(status:"rejected")
          redirect_to @product
        end
      end
    end

  private
    def products_params
      params.require(:product).permit(:name, :detail, :price , :image , :status, :category_id)
    end

end
