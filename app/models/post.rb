class Post < ApplicationRecord
  validate :content, {presence: true, length: {maximum: 140}}
end
