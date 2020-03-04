require 'rails_helper'

describe 'Olympian stats API' do
  before(:each) do
    @typing = Sport.create(name: "Typing")
    @running = Sport.create(name: "Running")

    @olymp_1 = Olympian.create(name: "Ryan H", sex: "M", age: 25, height: 175, weight: 100, team: "USA", sport_id: @typing.id)
    @olymp_2 = Olympian.create(name: "Bob G", sex: "M", age: 38, height: 185, weight: 90, team: "USA", sport_id: @running.id)
    @olymp_3 = Olympian.create(name: "Jane Smith", sex: "F", age: 28, height: 165, weight: 70, team: "England", sport_id: @running.id)
    @olymp_4 = Olympian.create(name: "Carol G", sex: "F", age: 38, height: 160, weight: 75, team: "France", sport_id: @typing.id)
    @olymp_5 = Olympian.create(name: "Gary J", sex: "M", age: 45, height: 188, weight: 88, team: "Germany", sport_id: @running.id)
  end

  it "sends a breakdown of stats of all competitors" do
    get '/api/v1/olympian_stats'

    expect(response).to be_successful

    data = JSON.parse(response.body)

    expect(data["olympian_stats"]["total_competing_olympians"]).to eq(5)
    expect(data["olympian_stats"]["average_weight"]["male_olympians"]).to eq(92.7)
    expect(data["olympian_stats"]["average_weight"]["female_olympians"]).to eq(72.5)
    expect(data["olympian_stats"]["average_age"]).to eq(34.8)
  end
end
