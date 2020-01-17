class DestinationsController < ApplicationController
    before_action :find_destination, only: [:show, :edit]
    def index 
        @destinations = Destination.all
    end

    def new 
        @destination = Destination.new 
    end

    # def show
    #     @destination = Destination.all.find(params[:id])
    # end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save 
            redirect_to @destination
        else
            render :new 
        end
    end

    def update
        @destination = Destination.find(params[:id])
        @destination.update(destination_params)
        if @destination.save
            redirect_to @destination
        else
            render :edit
        end

    end

    # def destroy
    # end

    private
    def find_destination
        @destination = Destination.find(params[:id])
    end

    def destination_params
        params.require(:destination).permit(:name, :country)
    end
end
