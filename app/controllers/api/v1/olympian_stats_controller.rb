class Api::V1::OlympianStatsController < ApplicationController
  def index
    render json: OlympianStatsSerializer.new(Olympian.all).json_response
  end
end
