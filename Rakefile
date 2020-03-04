# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'csv'

Rails.application.load_tasks

namespace :import_data do
  task import_olympians: :environment do
    CSV.foreach("olympic_data_2016.csv", headers: true) do |row|
      row = row.to_hash

      sport = Sport.find_or_create_by(
        name: row["Sport"]
      )

      olympian = Olympian.find_or_create_by(
        name: row["Name"],
        sex: row["Sex"],
        age: row["Age"],
        height: row["Height"],
        weight: row["Weight"],
        team: row["Team"],
        sport_id: sport.id
      )

      event = Event.find_or_create_by(
        games: row["Games"],
        event: row["Event"],
        sport_id: sport.id,
        olympian_id: olympian.id
      )
    end
  end
end
