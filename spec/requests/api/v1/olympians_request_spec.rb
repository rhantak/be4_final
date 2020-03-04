require 'rails_helper'

describe 'Olympians API' do
  before(:each) do
    @typing = Sport.create(name: "Typing")
    @running = Sport.create(name: "Running")

    @olymp_1 = Olympian.create(name: "Ryan H", sex: "M", age: 25, height: 175, weight: 100, team: "USA", sport_id: @typing.id)
    @olymp_2 = Olympian.create(name: "Bob G", sex: "M", age: 38, height: 185, weight: 90, team: "USA", sport_id: @running.id)

    @event_1 = Event.create(games: "2016 Olympics", event: "100 word dash", sport_id: @typing.id)
    @event_2 = Event.create(games: "2016 Olympics", event: "Special characters", sport_id: @typing.id)
    @event_3 = Event.create(games: "2016 Olympics", event: "Running fast", sport_id: @running.id)
    @event_4 = Event.create(games: "2016 Olympics", event: "Running medium", sport_id: @running.id)

    OlympianEvent.create(olympian_id: @olymp_1.id, event_id: @event_1.id, medal: "Silver")
    OlympianEvent.create(olympian_id: @olymp_1.id, event_id: @event_2.id, medal: "NA")
    OlympianEvent.create(olympian_id: @olymp_2.id, event_id: @event_3.id, medal: "Silver")
    OlympianEvent.create(olympian_id: @olymp_2.id, event_id: @event_4.id, medal: "Gold")
  end

  it 'sends a list of all olympians' do
    get '/api/v1/olympians'

    expect(response).to be_successful

    data = JSON.parse(response.body)

    expect(data["olympians"].count).to eq(2)

    expect(data["olympians"][0]["name"]).to eq(@olymp_1.name)
    expect(data["olympians"][0]["team"]).to eq(@olymp_1.team)
    expect(data["olympians"][0]["sport"]).to eq(@olymp_1.sport.name)
    expect(data["olympians"][0]["total_medals_won"]).to eq(1)

    expect(data["olympians"][1]["name"]).to eq(@olymp_2.name)
    expect(data["olympians"][1]["team"]).to eq(@olymp_2.team)
    expect(data["olympians"][1]["sport"]).to eq(@olymp_2.sport.name)
    expect(data["olympians"][1]["total_medals_won"]).to eq(2)
  end

  it 'sends the youngest olympian' do
    get '/api/v1/olympians?age=youngest'

    expect(response).to be_successful

    data = JSON.parse(response.body)

    expect(data["olympians"].count).to eq(1)

    expect(data["olympians"][0]["name"]).to eq(@olymp_1.name)
    expect(data["olympians"][0]["team"]).to eq(@olymp_1.team)
    expect(data["olympians"][0]["sport"]).to eq(@olymp_1.sport.name)
    expect(data["olympians"][0]["total_medals_won"]).to eq(1)
  end

  it 'sends the oldest olympian' do
    get '/api/v1/olympians?age=oldest'

    expect(response).to be_successful

    data = JSON.parse(response.body)

    expect(data["olympians"].count).to eq(1)

    expect(data["olympians"][0]["name"]).to eq(@olymp_2.name)
    expect(data["olympians"][0]["team"]).to eq(@olymp_2.team)
    expect(data["olympians"][0]["sport"]).to eq(@olymp_2.sport.name)
    expect(data["olympians"][0]["total_medals_won"]).to eq(2)
  end
end
