class HomepageController < ApplicationController

  include HomepageHelper

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
