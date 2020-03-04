class Olympian < ApplicationRecord
  validates_presence_of :name, :sex, :age, :height, :weight, :team, :sport
  has_many :events

  def total_medals_won
    events.where.not(medal: "NA").count
  end

  def self.youngest
    minimum_age = Olympian.minimum(:age)
    Olympian.where(age: minimum_age)
  end

  def self.oldest
    maximum_age = Olympian.maximum(:age)
    Olympian.where(age: maximum_age)
  end
end
