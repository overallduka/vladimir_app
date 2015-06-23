class PagesController < ApplicationController

  before_action :authenticate_user!, only: [:user_account]

  def index

  end

  def user_account

    render :layout => false
  end

end

