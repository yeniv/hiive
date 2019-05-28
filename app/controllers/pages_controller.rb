class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :discover] # also :discover here?, should be available to everyone

  def home
  end

  def discover
  end
end
