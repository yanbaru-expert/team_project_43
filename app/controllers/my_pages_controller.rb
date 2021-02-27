class MyPagesController < ApplicationController
  def index
    @basic_read_count = current_user.read_texts.where(genre: "Basic").count
    @basic_count = Text.where(genre: "Basic").count
  end
end
