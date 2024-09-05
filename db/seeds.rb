require "seeds_helper"

def seed(file)
  load Rails.root.join("db", "seeds", "#{file}.rb")
  puts "Seeded #{file}"
end

ActiveJob::Base.queue_adapter = :inline
ActionMailer::Base.delivery_method = :test

Rails.configuration.developer_response_grace_period = nil

puts "Seeding #{Rails.env} database..."
seed "books"
puts "Seeded database"

