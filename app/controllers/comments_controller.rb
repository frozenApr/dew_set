class CommentsController < ApplicationController
  before_action :set_post
  def create
    @comment = @post.comments.new(comment_params)
    @comment.save!
    redirect_to :root
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :original_id, :original_author_id).merge(author_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
