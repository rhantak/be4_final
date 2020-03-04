class Olympian < ApplicationRecord
  validates_presence_of :name, :sex, :age, :height, :weight, :team, :sport
  has_many :events
end
