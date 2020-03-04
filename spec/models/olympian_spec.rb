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

  describe 'class methods' do
    it "can find the youngest olympian" do
      @olymp_1 = Olympian.create(name: "Ryan H", sex: "M", age: 25, height: 175, weight: 100, team: "USA", sport: "Typing")
      @olymp_2 = Olympian.create(name: "Bob G", sex: "M", age: 38, height: 185, weight: 90, team: "USA", sport: "Running")
      @olymp_3 = Olympian.create(name: "Jack Smith", sex: "M", age: 17, height: 165, weight: 95, team: "Zimbabwe", sport: "Running")

      expect(Olympian.youngest[0]).to eq(@olymp_3)
    end

    it "can find the oldest olympian" do
      @olymp_1 = Olympian.create(name: "Ryan H", sex: "M", age: 25, height: 175, weight: 100, team: "USA", sport: "Typing")
      @olymp_2 = Olympian.create(name: "Bob G", sex: "M", age: 38, height: 185, weight: 90, team: "USA", sport: "Running")
      @olymp_3 = Olympian.create(name: "Jack Smith", sex: "M", age: 17, height: 165, weight: 95, team: "Zimbabwe", sport: "Running")

      expect(Olympian.oldest[0]).to eq(@olymp_2)
    end

    it "can calculate average weight" do
      @olymp_1 = Olympian.create(name: "Ryan H", sex: "M", age: 25, height: 175, weight: 100, team: "USA", sport: "Typing")
      @olymp_2 = Olympian.create(name: "Bob G", sex: "M", age: 38, height: 185, weight: 90, team: "USA", sport: "Running")
      @olymp_3 = Olympian.create(name: "Jane Smith", sex: "F", age: 28, height: 165, weight: 70, team: "England", sport: "Running")
      @olymp_4 = Olympian.create(name: "Carol G", sex: "F", age: 38, height: 160, weight: 75, team: "France", sport: "Typing")
      @olymp_5 = Olympian.create(name: "Gary J", sex: "M", age: 45, height: 188, weight: 88, team: "Germany", sport: "Running")

      expect(Olympian.average_weight[:unit]).to eq("kg")
      expect(Olympian.average_weight[:male_olympians]).to eq(92.7)
      expect(Olympian.average_weight[:female_olympians]).to eq(72.5)
    end
  end
end
