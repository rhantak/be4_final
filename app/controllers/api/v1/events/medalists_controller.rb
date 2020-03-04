class Api::V1::Events::MedalistsController < ApplicationController
  def index
    if !Event.where(id: params[:id]).empty?
      event = Event.find(params[:id])
      render json: MedalistSerializer.new(event).json_response
    else
      render json: {
        "error": "Unable to find medalists.",
        "detail": "Could not find an event with id = #{params[:id]}. Please check your event id and try again."
      }, status: 404
    end
  end
end
