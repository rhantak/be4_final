class Event < ApplicationRecord
  validates_presence_of :games, :sport, :event, :medal
  belongs_to :olympian
end
