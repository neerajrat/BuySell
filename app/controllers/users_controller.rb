class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
  
  def block
    @user = User.find(params[:user_id])
    if @user.update(status:"blocked")
      redirect_to @user
    end
  end


  def unblock
    @user = User.find(params[:user_id])
    if @user.update(status:"unblock")
      redirect_to @user
    end
  end
  



  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :mobile)    
  end
end
