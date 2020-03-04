class MedalistSerializer
  def initialize(event)
    @event = event
  end

  def json_response
    medalist_data = event.olympian_events.where.not(medal: "NA")
    medalists = medalist_data.map do |medal_earned|
      medalist = Olympian.find(medal_earned.olympian_id)
      {
        "name": medalist.name,
        "team": medalist.team,
        "age": medalist.age,
        "medal": medal_earned.medal
      }
    end
    
    {"event": event.event, "medalists": medalists}
  end

  private

  attr_reader :event
end
