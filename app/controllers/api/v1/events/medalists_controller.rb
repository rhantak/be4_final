class Api::V1::Events::MedalistsController < ApplicationController
  def index
    event = Event.find(params[:id])
    render json: MedalistSerializer.new(event).json_response
  end
end
