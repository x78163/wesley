class PagesController < ApplicationController
 skip_before_action :authenticate_user!, only: :home
  def home

  end

  def history

  end

  def team

  end

  def indexhome
  end

  def construction
  end
end
