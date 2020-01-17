class DestinationsController < ApplicationController
    before_action :find_destination, only: [:show]

    private 

	def find_destination
		@destination = Destination.find(params[:id])
    end
end