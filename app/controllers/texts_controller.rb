class TextsController < ApplicationController
  def index

  end

  def show
    @text = Text.find(params[:id])
  end
end