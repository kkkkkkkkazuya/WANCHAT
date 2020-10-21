class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like

  def create
    post = Post.find(params[:post_id])
    like = Like.create(user_id: current_user.id, post_id: post.id)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = Like.find_by(user_id: current_user.id, post_id: post.id)
    like.delete
  end

  private
  def set_like
    @post = Post.find(params[:post_id])
  end

end
