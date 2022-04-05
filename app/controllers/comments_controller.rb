class CommentsController < ApplicationController
  def create
    pop = Pop.find(params[:pop_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.pop = pop
    comment.save
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
end
