class Public::ProfilesController < ApplicationController
  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update
    @profile = User.find(params[:user_id]).profile
    if @profile.update(profile_params)
      redirect_to user_path(params[:user_id])
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:image, :user_name, :birthday, :bio)
  end
end
