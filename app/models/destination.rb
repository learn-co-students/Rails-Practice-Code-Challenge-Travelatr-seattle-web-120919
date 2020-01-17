class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts
  validates_length_of :content, :minimum => 101

  # def 5_most_recent
  #   most_recent = []
  #   self.posts.each do |post|
  #     most_recent.each do |record|
  #       if post.created_at > record

  #       end
  #     end
  #   end
  # end

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
