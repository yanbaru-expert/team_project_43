class MyPagesController < ApplicationController
  def index
    @progress_data = Genre.progress_data(current_user)
  end
end