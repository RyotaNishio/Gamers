class Public::UsersController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    guest = Profile.find_by(user_name: 'guest')
    @users = User.where.not(id: guest.user_id)
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @pops = Pop.where(user: @user).order('created_at DESC')
  end

  def search
    @users = @q.result
    guest = Profile.find_by(user_name: 'guest')
    @users = @users.where.not(id: guest.user_id)
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end
end
