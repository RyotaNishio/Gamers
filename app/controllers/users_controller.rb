class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @pops = Pop.where(user: @user).order('created_at DESC')
  end
end
