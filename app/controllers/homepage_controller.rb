class HomepageController < ApplicationController
  def about
  end

  def index
  end

  def main
    @users = User.all
  end

  def contact
  end

  def splash
  end
end
