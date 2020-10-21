class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def posts
    return Post.where(user_id: self.id)
  end

  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

end
