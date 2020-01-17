class Destination < ApplicationRecord
    has_many :posts 
    has_many :bloggers, through: :posts

    def five_most_recent
        postsarray = self.posts.sort_by do |post|
            post.created_at
        end
        postsarray.map do |post|
            post.title
        end
    end

    def most_liked
        postsarray = self.posts.sort_by do |post|
            post.likes
        end

        postsarray.last
    end

    def avg_age
        bloggerarray = self.bloggers.map do |blogger|
            blogger.age
        end

        bloggerarray.reduce(0) do |total, age|
            total += age
        end  / bloggerarray.length
    end
end
