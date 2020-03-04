require 'rails_helper'

describe 'Events API' do
  before(:each) do
    @typing = Sport.create(name: "Typing")
    @running = Sport.create(name: "Running")

    @olymp_1 = Olympian.create(name: "Ryan H", sex: "M", age: 25, height: 175, weight: 100, team: "USA", sport_id: @typing.id)
    @olymp_2 = Olympian.create(name: "Bob G", sex: "M", age: 38, height: 185, weight: 90, team: "USA", sport_id: @running.id)
    @olymp_3 = Olympian.create(name: "Jane Smith", sex: "F", age: 28, height: 165, weight: 70, team: "England", sport_id: @running.id)
    @olymp_4 = Olympian.create(name: "Carol G", sex: "F", age: 38, height: 160, weight: 75, team: "France", sport_id: @typing.id)
    @olymp_5 = Olympian.create(name: "Gary J", sex: "M", age: 45, height: 188, weight: 88, team: "Germany", sport_id: @running.id)

    Event.create(games: "2016 Olympics", event: "100 word dash", medal: "Silver", olympian_id: @olymp_1.id, sport_id: @typing.id)
    Event.create(games: "2016 Olympics", event: "Special characters", medal: "NA", olympian_id: @olymp_1.id, sport_id: @typing.id)
    Event.create(games: "2016 Olympics", event: "Running fast", medal: "Silver", olympian_id: @olymp_2.id, sport_id: @running.id)
    Event.create(games: "2016 Olympics", event: "Running medium", medal: "Gold", olympian_id: @olymp_2.id, sport_id: @running.id)
    Event.create(games: "2016 Olympics", event: "Running medium", medal: "Bronze", olympian_id: @olymp_3.id, sport_id: @running.id)
    Event.create(games: "2016 Olympics", event: "Running long distance", medal: "Gold", olympian_id: @olymp_3.id, sport_id: @running.id)
    Event.create(games: "2016 Olympics", event: "Special characters", medal: "Gold", olympian_id: @olymp_4.id, sport_id: @typing.id)
    Event.create(games: "2016 Olympics", event: "ASCII characters", medal: "Silver", olympian_id: @olymp_4.id, sport_id: @typing.id)
    Event.create(games: "2016 Olympics", event: "Running long distance", medal: "NA", olympian_id: @olymp_5.id, sport_id: @running.id)
    Event.create(games: "2016 Olympics", event: "Running in slo mo", medal: "Gold", olympian_id: @olymp_5.id, sport_id: @running.id)
  end

  it "sends a list of events by sport" do
    get '/api/v1/events'

    expect(response).to be_successful

    data = JSON.parse(response.body)

    expect(data["events"].count).to eq(2)

    expect(data["events"][0]["sport"]).to eq("Typing")
    expect(data["events"][0]["events"].count).to eq(3)
    expect(data["events"][0]["events"][0]).to eq("100 word dash")
    expect(data["events"][0]["events"][1]).to eq("Special characters")
    expect(data["events"][0]["events"][2]).to eq("ASCII characters")

    expect(data["events"][1]["sport"]).to eq("Running")
    expect(data["events"][1]["events"].count).to eq(4)
    expect(data["events"][1]["events"][0]).to eq("Running fast")
    expect(data["events"][1]["events"][1]).to eq("Running medium")
    expect(data["events"][1]["events"][2]).to eq("Running long distance")
    expect(data["events"][1]["events"][3]).to eq("Running in slo mo")
  end
end
