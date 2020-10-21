class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}

  has_many :likes

  def user
    return User.find_by(id: self.user_id)
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
