class BloggersController < ApplicationController
  before_action :find_blogger, only: [:show]

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

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end
end
