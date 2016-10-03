class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

    def update
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  def upvote
    if not @post.user.id == current_user.id
      @post.upvote_by current_user
      @post.user.points += 1
      redirect_to :back
    end
  end

  def downvote
    if not @post.user.id == current_user.id
      @post.downvote_by current_user
      @post.user.points -= 1
      redirect_to :back
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
