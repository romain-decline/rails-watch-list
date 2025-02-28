# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating movies..."
List.destroy_all
Movie.destroy_all

require "open-uri"
require "json"

url = "https://tmdb.lewagon.com/movie/top_rated"
json = URI.open(url).read
doc = JSON.parse(json)
doc["results"].each do |movie|
  Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}", rating: movie["vote_average"])
end

puts "#{Movie.count} movies created!"

# puts "Creating lists..."

# List.create(name: "animation")
# List.create(name: "action")

# puts "#{List.count} lists created!"
