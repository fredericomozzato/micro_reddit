class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show ]

  def index
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Post created"
    else
      flash.now[:alert] = "Error creating post"
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
