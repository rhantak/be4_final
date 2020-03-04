class Olympian < ApplicationRecord
  validates_presence_of :name, :sex, :age, :height, :weight, :team
  has_many :events
end
