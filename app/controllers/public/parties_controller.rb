class Public::PartiesController < ApplicationController
  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    @party.user_join(@party.owner)
    @party.save
    redirect_to party_path(@party.id)
  end

  def index
    @parties = Party.all
  end

  def show
    @party = Party.find(params[:id])
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    @party.update(party_params)
    redirect_to party_path(@party.id)
  end

  def join
    party = Party.find(params[:id])
    if current_user.party_id.nil?
      party.user_join(current_user)
      party.create_notification_party!(current_user)
      redirect_to party_path(party.id)
    else
      redirect_to parties_path
    end
  end

  def withdraw
    party = Party.find(params[:id])
    party.user_withdraw(current_user)
    current_user.update(party_id: nil)
    if party.owner == current_user
      party.destroy
    end
    redirect_to parties_path
  end

  private

  def party_params
    params.require(:party).permit(:owner_id, :title, :introduction, :difficulty, :recruitment_numbers)
  end
end
