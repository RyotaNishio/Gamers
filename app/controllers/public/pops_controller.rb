class Public::PopsController < ApplicationController
  before_action :require_sign_in, only: [:create]
  before_action :set_q, only: [:index, :search, :create]
  def create
    @pop = Pop.new(pop_params)
    @pop.user = current_user
    @pops = Pop.all.order('created_at DESC')
    if @pop.save
      redirect_to pops_path
    else
      render :index
    end
  end

  def index
    @pops = Pop.all.order('created_at DESC')
    @pop = Pop.new
  end

  def only_followings
    @pops = Pop.where(user: [current_user, *current_user.followings])
    @pop = Pop.new
  end

  def show
    @pop = Pop.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @pop = Pop.find(params[:id])
  end

  def update
    @pop = Pop.find(params[:id])
    if @pop.update(pop_params)
      redirect_to pop_path(@pop.id)
    else
      render :edit
    end
  end

  def destroy
    pop = Pop.find(params[:id])
    pop.destroy
    redirect_to pops_path
  end

  def search
    @pops = @q.result
    @pop = Pop.new
  end

  private

  def pop_params
    params.require(:pop).permit(:body, :image)
  end

  def require_sign_in
    if current_user.guest?
      redirect_to new_user_registration_path
    end
  end

  def set_q
    @q = Pop.ransack(params[:q])
  end
end
