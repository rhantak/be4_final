class AddOlympianToEvent < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :olympian, foreign_key: true
  end
end
