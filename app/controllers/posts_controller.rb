class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit]
    def index 
        @posts = Post.all
    end

    def new 
        @post = Post.new 
    end

    def create
        @post = Post.new(post_params)
        if @post.save 
            redirect_to @post
        else
            render :new 
        end
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.save
            redirect_to @post
        else
            render :edit
        end

    end

    # def destroy
    # end

    private
    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end