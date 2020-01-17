class Blogger < ApplicationRecord
    has_many :posts 
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def total_likes
        postlikes = self.posts.map do |post|
            post.likes
        end
        
        postlikes.reduce(0) do |total, likes|
            total += likes 
        end
    end

    def most_liked
        postsarray = self.posts.sort_by do |post|
            post.likes
        end

        postsarray.last
    end
end
