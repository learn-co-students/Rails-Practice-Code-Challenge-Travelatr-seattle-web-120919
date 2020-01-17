class DestinationsController < ApplicationController
  before_action :find_destination, only: [:show]

  def index
    @destinations = Destination.all
  end

  private

  def find_destination
    @destination = Destination.find(params[:id])
  end
end
