class TextsController < ApplicationController
  def index
    genre_rails = ["Basic", "Git", "HTML&CSS", "Ruby", "Ruby on Rails"]
    @texts = Text.where(genre: genre_rails)
  end
end