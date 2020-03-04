require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :sex}
    it { should validate_presence_of :age}
    it { should validate_presence_of :height}
    it { should validate_presence_of :weight}
    it { should validate_presence_of :team}
  end

  describe 'relationships' do
    it { should belong_to :sport }
    it { should have_many :events }
  end

  describe 'instance methods' do
    it "can calculate total number of medals won" do
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
      OlympianEvent.create(olympian_id: @olymp_2.id, event_id: @event_3.id, medal: "Gold")
      OlympianEvent.create(olympian_id: @olymp_2.id, event_id: @event_4.id, medal: "Bronze")

      expect(@olymp_1.total_medals_won).to eq(1)
      expect(@olymp_2.total_medals_won).to eq(2)
    end
  end

  describe 'class methods' do
    before(:each) do
      @typing = Sport.create(name: "Typing")
      @running = Sport.create(name: "Running")

      @olymp_1 = Olympian.create(name: "Ryan H", sex: "M", age: 25, height: 175, weight: 100, team: "USA", sport_id: @typing.id)
      @olymp_2 = Olympian.create(name: "Bob G", sex: "M", age: 38, height: 185, weight: 90, team: "USA", sport_id: @running.id)
      @olymp_3 = Olympian.create(name: "Jane Smith", sex: "F", age: 28, height: 165, weight: 70, team: "England", sport_id: @running.id)
      @olymp_4 = Olympian.create(name: "Carol G", sex: "F", age: 38, height: 160, weight: 75, team: "France", sport_id: @typing.id)
      @olymp_5 = Olympian.create(name: "Gary J", sex: "M", age: 45, height: 188, weight: 88, team: "Germany", sport_id: @running.id)

    end
    it "can find the youngest olympian" do
      expect(Olympian.youngest[0]).to eq(@olymp_1)
    end

    it "can find the oldest olympian" do
      expect(Olympian.oldest[0]).to eq(@olymp_5)
    end

    it "can calculate average weight" do
      expect(Olympian.average_weight[:unit]).to eq("kg")
      expect(Olympian.average_weight[:male_olympians]).to eq(92.7)
      expect(Olympian.average_weight[:female_olympians]).to eq(72.5)
    end

    it "can calculate average age" do
      expect(Olympian.average_age).to eq(34.8)
    end
  end
end
