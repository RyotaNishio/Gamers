class Public::ProfilesController < ApplicationController
  before_action :require_sign_in

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

  def require_sign_in
    if current_user.guest?
      redirect_to root_path
    end
  end
end
