class TextsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    genre_rails = ["Basic", "Git", "HTML&CSS", "Ruby", "Ruby on Rails"]
    @texts = Text.where(genre: genre_rails).order("id")
    @read_text_ids = current_user.reads.pluck(:text_id) if user_signed_in?
  end

  def show   
    @text = Text.find(params[:id])
  end
end