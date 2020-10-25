class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, {only: [:edit, :update]}

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "飼主変更完了！"
      redirect_to(user_path(@user.id))
    else
      render action: :edit
    end
  end

  def comments
    @user = User.find_by(id: params[:user_id])
  end

  def likes
    @user = User.find_by(id: params[:user_id])
    @likes = Like.where(user_id: @user.id)
  end

  def ensure_current_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "本人のみ編集ができます"
      redirect_to(posts_path)
    end
  end
end
