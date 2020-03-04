class Api::V1::OlympiansController < ApplicationController
  def index
    if request.query_parameters['age'] == "youngest"
      render json: OlympianSerializer.new(Olympian.youngest).json_response
    elsif request.query_parameters['age'] == "oldest"
      render json: OlympianSerializer.new(Olympian.oldest).json_response
    else
      render json: OlympianSerializer.new(Olympian.all).json_response
    end
  end
end
