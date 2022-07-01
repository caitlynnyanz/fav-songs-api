require "http"
require "tty-table"

puts "Welcome to the Favorite Songs App!"
puts "Here's a list of some of my fav songs:"

response = HTTP.get("http://localhost:3000/songs")

data = JSON.parse(response.body)
index = 0
rows = []

while index < data.length
  title = data[index]["title"]
  album = data[index]["album"]
  artist = data[index]["artist"]
  year = data[index]["year"]

  rows << [title, artist, album, year]
  index = index + 1
end

table = TTY::Table.new(["Title", "Artist", "Album", "Year"], rows)

puts table.render(:ascii, resize: true)
