class Api::V1::OlympiansController < ApplicationController
  def index
    if request.query_parameters['age']
      handle_age_parameter
    else
      render json: OlympianSerializer.new(Olympian.all).json_response
    end
  end
  private

  def handle_age_parameter
    if request.query_parameters['age'] == "youngest"
      render json: OlympianSerializer.new(Olympian.youngest).json_response
    elsif request.query_parameters['age'] == "oldest"
      render json: OlympianSerializer.new(Olympian.oldest).json_response
    else
      render json: {
        "error": "Poorly formatted request",
        "detail": "\"#{request.query_parameters['age']}\" is not a valid value for the age parameter."
        }, status: 400
    end
  end
end
