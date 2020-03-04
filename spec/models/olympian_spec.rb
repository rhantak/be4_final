require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :sex}
    it { should validate_presence_of :age}
    it { should validate_presence_of :height}
    it { should validate_presence_of :weight}
    it { should validate_presence_of :team}
    it { should validate_presence_of :sport }
  end

  describe 'relationships' do
    it { should have_many :events}
  end

  describe 'instance methods' do
    it "can calculate total number of medals won" do
      @olymp_1 = Olympian.create(name: "Ryan H", sex: "M", age: 25, height: 175, weight: 100, team: "USA", sport: "Typing")
      @olymp_2 = Olympian.create(name: "Bob G", sex: "M", age: 38, height: 185, weight: 90, team: "USA", sport: "Running")

      Event.create(games: "2016 Olympics", event: "100 word dash", medal: "Silver", olympian_id: @olymp_1.id)
      Event.create(games: "2016 Olympics", event: "Special characters", medal: "NA", olympian_id: @olymp_1.id)
      Event.create(games: "2016 Olympics", event: "Running fast", medal: "Silver", olympian_id: @olymp_2.id)
      Event.create(games: "2016 Olympics", event: "Running medium", medal: "Gold", olympian_id: @olymp_2.id)

      expect(@olymp_1.total_medals_won).to eq(1)
      expect(@olymp_2.total_medals_won).to eq(2)
    end
  end
end
