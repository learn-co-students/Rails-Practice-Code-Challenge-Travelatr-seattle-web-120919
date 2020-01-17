class BloggersController < ApplicationController
    before_action :find_blogger, only: [:show, :edit]
    def index 
        @bloggers = Blogger.all
    end

    def new 
        @blogger = Blogger.new 
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save 
            redirect_to @blogger
        else
            render :new 
        end
    end

    def update
        @blogger = Blogger.find(params[:id])
        @blogger.update(blogger_params)
        if @blogger.save
            redirect_to @blogger
        else
            render :edit
        end

    end

    # def destroy
    # end

    private
    def find_blogger
        @blogger = Blogger.find(params[:id])
    end

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end
