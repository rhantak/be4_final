class Event < ApplicationRecord
  validates_presence_of :games, :event, :medal
  belongs_to :olympian
end
