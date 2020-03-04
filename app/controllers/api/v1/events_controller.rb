class Api::V1::EventsController < ApplicationController
  def index
    render json: EventSerializer.new(Event.all).json_response
  end
end
