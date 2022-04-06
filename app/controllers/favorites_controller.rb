class FavoritesController < ApplicationController
  def create
    pop = Pop.find(params[:pop_id])
    favorite = current_user.favorites.new(pop: pop)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    pop = Pop.find(params[:pop_id])
    favorite = current_user.favorites.find_by(pop: pop)
    favorite.destroy
    redirect_to request.referer
  end
end
