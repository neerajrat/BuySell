class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
     redirect_to products_index_path
  end
  def user
  end
  def admin
  end
  def main
  end
end
