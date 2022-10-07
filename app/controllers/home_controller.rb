class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.role == "User"
      redirect_to home_user_path
    else
      redirect_to home_admin_path
    end
  end
  def user
  end
  def admin
  end
  def main
  end
end
