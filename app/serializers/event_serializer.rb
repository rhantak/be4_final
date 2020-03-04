class EventSerializer
  def initialize(events_data)
    @events_data = events_data
  end

  def json_response
    events = []
    Sport.all.map do |sport|
      info = {
        "sport": sport.name,
        "events": sport.events.pluck(:event).uniq
      }
      events << info
    end
    {"events": events}
  end
end
