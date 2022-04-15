class Public::CommentsController < ApplicationController
  before_action :require_sign_in, only: [:create]

  def create
    pop = Pop.find(params[:pop_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.pop = pop
    comment.save
    pop.create_notification_comment!(current_user, comment.id)
    redirect_to pop_path(params[:pop_id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to pops_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def require_sign_in
    if current_user.guest?
      redirect_to new_user_registration_path
    end
  end
end
