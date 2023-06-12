# frozen_string_literal: true

require 'csv'

namespace :import do
  desc "Imports a CSV file into an users table"
  task :import_users, [:file] => :environment do |task, args|  
    begin
      CSV.foreach(args[:file], headers: true) do |row|
        user_hash = row.to_hash
        user = User.find_by(email: user_hash["email"])
        if user.present?
          user.update_attributes(user_hash)
        else
          User.create!(user_hash)
        end
      end
    rescue StandardError => e
      puts "\n"
      puts "The task is failed and the error is #{e.inspect}"
      puts "\n"
    end
  end
end
