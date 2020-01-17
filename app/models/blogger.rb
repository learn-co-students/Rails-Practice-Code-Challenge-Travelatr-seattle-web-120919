class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates_length_of :bio, :minimum => 31

  def total_likes
    total = 0
    self.posts.each do |post|
      total += post.likes
    end
    total
  end

  def most_likes
    most = 0
    most_post = self.posts.first
    self.posts.each do |post|
      if post.likes > most
        most = post.likes
        most_post = post
      end
    end
    most_post
  end
end
