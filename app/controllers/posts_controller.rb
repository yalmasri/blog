class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

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
    render json: { data: @post, meta: {} }, status: 200
  end

  def update
    if @post.update post_params
      render json: { data: @post, meta: {} }, status: 200
    else
      render json: {
        errors: @post.errors.messages,
        messages: @post.errors.full_messages,
        details: @post.errors.details
      }, status: 422
    end
  end

  def destroy
    @post.destroy
    render json: { data: {}, meta: {} }, status: 204
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find params[:id]
  end
end
