class BloggersController < ApplicationController
    def show 
        @blogger = Blogger.find(params[:id])
    end

    def new 
        @blogger = Blogger.new
    end

    def create 
        @blogger = Blogger.new(params.require(:blogger).permit(:name, :bio, :age))
    end

end