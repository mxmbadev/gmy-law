class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @post = Post.all.order("created_at desc")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, notice: "Sucess! Your Post Has Been Saved!"
    else
      render 'new', notice: "Sorry, Your Post Wasn't Successfully Saved."
    end
  end

  def show

  end

  def edit

  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Great! Your Post Was Successfully Saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "You Deleted Your Post Succesfully"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :date, :slug, :img)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end

end
