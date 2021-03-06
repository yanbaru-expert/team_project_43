class MoviesController < ApplicationController
  PER_PAGE = 6
  def index
    rails_movies = ["Basic", "Git", "HTML&CSS", "Ruby", "Ruby on Rails"]
    if params[:genre] == nil
      @movies = Movie.where(genre: rails_movies).order(id: :asc).page(params[:page]).per(PER_PAGE)
    else
      @movies = Movie.where(genre: params[:genre]).order(id: :asc).page(params[:page]).per(PER_PAGE)
    end
  end
end