class TextsController < ApplicationController
  def index
    genre_rails = ["Basic", "Git", "HTML&CSS", "Ruby", "Ruby on Rails"]
    @texts = Text.where(genre: genre_rails).order("id")
    @read_text_ids = current_user.reads.pluck(:text_id)
  end

  def show
    @text = Text.find(params[:id])
  end
end