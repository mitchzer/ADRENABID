class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :info]

  def home
    render :layout => "home.html.erb"
  end

  def info
    render "info.html.erb"
  end
end
