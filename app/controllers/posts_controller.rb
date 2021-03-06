class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :check_permissions, only: [:edit, :destroy]
  def index
    if params[:query].present?
      @posts = Post.search(params[:query], page: params[:page], per_page: 10)
    elsif params[:category_id].present?
      @posts = Category.find(params[:category_id]).posts.page(params[:page]).per(10)
    else
      @posts = Post.all.page(params[:page]).per(10)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post, notice: 'Post successfully created.'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: 'Post successfully updated.'
    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])

    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_ids=>[])
  end

  def check_permissions
    @post = Post.find(params[:id])
    unless current_user.admin? or current_user == @post.user
      redirect_to post_path(@post), alert: 'You can\'t edit not your own posts.'
    end
  end
end
