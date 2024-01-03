class CommentsController < ApplicationController
  before_action :set_post, only: %i[ new create edit update destroy ]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comment_params.merge(author: current_user))
    @comment.save!
    redirect_to @post
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
