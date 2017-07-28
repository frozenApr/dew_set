class CommentsController < ApplicationController
  def create
    @comment = Post.find(params[:post_id]).comments.new(comment_params)
    @comment.save
    redirect_to :root
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
