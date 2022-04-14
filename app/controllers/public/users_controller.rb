class Public::UsersController < ApplicationController
  before_action :set_q, only: [:index, :search]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @pops = Pop.where(user: @user).order('created_at DESC')
  end
  
  def search
    @results = @q.result
  end
  
  private
  
  def set_q
    @q = User.ransack(params[:q])
  end
end
