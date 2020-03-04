class CreateEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :games
      t.string :event
      t.string :medal
    end
  end
end
