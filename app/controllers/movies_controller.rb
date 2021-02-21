class MoviesController < ApplicationController
  PER_PAGE = 9
  def index
    @movies = Movie.where(genre: ["Basic", "Git", "HTML&CSS", "Ruby", "Ruby on Rails"]).order(id: :asc).page(params[:page]).per(PER_PAGE)
  end
end