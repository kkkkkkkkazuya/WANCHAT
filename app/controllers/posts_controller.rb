class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
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

end
