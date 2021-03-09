class MyPagesController < ApplicationController
  def index
    @text_progress_data = Genre.progress_data(current_user, Text)
    @movie_progress_data = Genre.progress_data(current_user, Movie)
  end
end