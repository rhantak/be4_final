class OlympianSerializer
  def initialize(olympian_data)
    @olympian_data = olympian_data
  end

  def json_response
    olympians = []

    olympian_data.map do |olympian|
      olympians.push({
        "name": olympian.name,
        "team": olympian.team,
        "sport": olympian.sport.name,
        "total_medals_won": olympian.total_medals_won
        })
    end
    {"olympians": olympians}
  end

  private

  attr_reader :olympian_data
end
