class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: { data: posts, meta: {} }, status: 200
  end

  def create
    @post = Post.new post_params
    if @post.save
      render json: { data: @post, meta: {} }, status: 201
    else
      render json: {
        errors: @post.errors.messages,
        messages: @post.errors.full_messages,
        details: @post.errors.details
      }, status: 422
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
  end
end
