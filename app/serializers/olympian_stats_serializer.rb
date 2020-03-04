class OlympianStatsSerializer
  def initialize(olympian_data)
    @olympian_data = olympian_data
  end

  def json_response
    {
      "olympian_stats": {
        "total_competing_olympians": olympian_data.length,
        "average_weight": olympian_data.average_weight,
        "average_age": olympian_data.average_age
      }
    }
  end

  private

  attr_reader :olympian_data
end
