class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, {only: [:edit, :destroy, :update]}

  def index
    @search_post = Post.search(params[:q])
    @search_user = User.search(params[:q])
    @posts = @search_post.result
    @users = @search_user.result
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: current_user.id
    )

    if @post.save
      flash[:notice] = "投稿しました！"
      redirect_to(posts_path)
    else
      render action: :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "編集完了"
      redirect_to(posts_path)
    else
      render action: :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy!
    flash[:notice] = "投稿削除完了"
    redirect_to(posts_path)
  end

  def ensure_current_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != current_user.id
      flash[:notice] = "自分の投稿のみ編集・削除ができます"
      redirect_to(posts_path)
    end
  end

end
