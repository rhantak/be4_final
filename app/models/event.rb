class Event < ApplicationRecord
  validates_presence_of :games, :event
  has_many :olympian_events
  has_many :olympians, through: :olympian_events
  belongs_to :sport
end
