class MyPagesController < ApplicationController
  def index
    @genres_read_count = current_user.genres_read_count
    @genres_count = Text.genres_count
  end
end