class Olympian < ApplicationRecord
  validates_presence_of :name, :sex, :age, :height, :weight, :team, :sport
  has_many :events
  belongs_to :sport

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

  def self.average_weight
    male_weight = Olympian.where(sex: "M").average(:weight).round(1).to_f
    female_weight = Olympian.where(sex: "F").average(:weight).round(1).to_f

    {
      "unit": "kg",
      "male_olympians": male_weight,
      "female_olympians": female_weight,
    }
  end

  def self.average_age
    Olympian.average(:age).round(1).to_f
  end
end
