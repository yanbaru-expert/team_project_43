class WatchedsController < ApplicationController
  def create
    current_user.watcheds.create!(movie_id: params[:movie_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.watcheds.find_by(movie_id: params[:movie_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
end
