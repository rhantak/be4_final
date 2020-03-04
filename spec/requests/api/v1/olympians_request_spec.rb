require 'rails_helper'

describe 'Olympians API' do
  before(:each) do
    @olymp_1 = Olympian.create(name: "Ryan H", sex: "M", age: 25, height: 175, weight: 100, team: "USA", sport: "Typing")
    @olymp_2 = Olympian.create(name: "Bob G", sex: "M", age: 38, height: 185, weight: 90, team: "USA", sport: "Running")

    Event.create(games: "2016 Olympics", event: "100 word dash", medal: "Silver", olympian_id: @olymp_1.id)
    Event.create(games: "2016 Olympics", event: "Special characters", medal: "NA", olympian_id: @olymp_1.id)
    Event.create(games: "2016 Olympics", event: "Running fast", medal: "Silver", olympian_id: @olymp_2.id)
    Event.create(games: "2016 Olympics", event: "Running medium", medal: "Gold", olympian_id: @olymp_2.id)
  end

  it 'sends a list of all olympians' do
    get '/api/v1/olympians'

    expect(response).to be_successful

    data = JSON.parse(response.body)

    expect(data["olympians"].count).to eq(2)

    expect(data["olympians"][0]["name"]).to eq(@olymp_1.name)
    expect(data["olympians"][0]["team"]).to eq(@olymp_1.team)
    expect(data["olympians"][0]["sport"]).to eq(@olymp_1.sport)
    expect(data["olympians"][0]["total_medals_won"]).to eq(1)

    expect(data["olympians"][1]["name"]).to eq(@olymp_2.name)
    expect(data["olympians"][1]["team"]).to eq(@olymp_2.team)
    expect(data["olympians"][1]["sport"]).to eq(@olymp_2.sport)
    expect(data["olympians"][1]["total_medals_won"]).to eq(2)
  end

  it 'sends the youngest olympian' do
    get '/api/v1/olympians?age=youngest'

    expect(response).to be_successful

    data = JSON.parse(response.body)

    expect(data["olympians"].count).to eq(1)

    expect(data["olympians"][0]["name"]).to eq(@olymp_1.name)
    expect(data["olympians"][0]["team"]).to eq(@olymp_1.team)
    expect(data["olympians"][0]["sport"]).to eq(@olymp_1.sport)
    expect(data["olympians"][0]["total_medals_won"]).to eq(1)
  end

  it 'sends the oldest olympian' do
    get '/api/v1/olympians?age=oldest'

    expect(response).to be_successful

    data = JSON.parse(response.body)

    expect(data["olympians"].count).to eq(1)

    expect(data["olympians"][0]["name"]).to eq(@olymp_2.name)
    expect(data["olympians"][0]["team"]).to eq(@olymp_2.team)
    expect(data["olympians"][0]["sport"]).to eq(@olymp_2.sport)
    expect(data["olympians"][0]["total_medals_won"]).to eq(2)
  end
end
