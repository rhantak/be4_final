class Api::V1::OlympiansController < ApplicationController
  def index
    render json: OlympianSerializer.new(Olympian.all).json_response
  end
end
