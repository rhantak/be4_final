class Olympian < ApplicationRecord
  validates_presence_of :name, :sex, :age, :height, :weight, :team, :sport
  has_many :events

  def total_medals_won
    events.where.not(medal: "NA").count
  end
end
