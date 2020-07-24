class Post < ApplicationRecord
  belongs_to :user
  attachment :image

  validates :image, presence: true

  def self.search(search)
    return Post.all unless search
    Post.where(['title LIKE(?)',"%#{search}"])
  end
end
