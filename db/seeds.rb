# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create([{ name: 'Chattanooga', code: 'CHA' }, { name: 'Knoxville', code: 'TYS' },
                           { name: 'Memphis', code: 'MEM' }, { name: 'Nashville', code: 'BNA' }, { name: 'Tri-Cities', code: 'TRI' },
                           { name: 'Jackson', code: 'MKL' }, { name: 'Clarksville', code: 'CKV' }, { name: 'Smyrna', code: 'MQY' },
                           { name: 'Athens', code: 'MMI' }, { name: 'Centerville', code: 'GHM' }, { name: 'Cleveland', code: 'KRZR' },
                           { name: 'Columbia / Mt. Pleasant', code: 'MRC' }, { name: 'Crossville', code: 'CSV' },
                           { name: 'Dyersburg ', code: 'KDYR' }, { name: 'Fayetteville', code: 'FYM' }, { name: 'Gallatin', code: 'XNX' },
                           { name: 'Greeneville', code: 'CGY' }, { name: 'Huntingdon / McKenzie', code: 'KHZD' },
                           { name: 'Jacksboro', code: 'KJAU' }, { name: 'Jasper', code: 'APT' }, { name: 'Lewisburg', code: 'KLUG' },
                           { name: 'Lexington / Parsons', code: 'KPVE' }])

airports = Airport.all
duration = %w[30 60 90 120 150 180]
hours = (6..18).to_a
minutes = [15, 30, 45]

(0..airports.length).each do |i|
  (i + 1..airports.length).each do |j|
    rand_date = (Date.today + rand(100)).to_s
    rand_time = "#{hours.sample}:#{minutes.sample}"
    Flight.create(start: rand_date, duration: duration.sample,
                  departure_airport: airports[i], arrival_airport: airports[j],
                  scheduled_time: rand_time)
  end
end
