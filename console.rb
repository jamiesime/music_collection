require 'pry'
require_relative 'artist.rb'
require_relative 'album.rb'


artist1 = Artist.new({
  'name' => 'Tatsuro Yamashita'
  })

artist2 = Artist.new({
  'name' => 'Angel Olsen'
  })

album1 = Album.new({
  'title' => 'Ride On Time',
  'genre' => 'City-Pop',
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'title' => 'Burn Your Fire For No Witness',
  'genre' => 'Pop/Rock',
  'artist_id' => artist2.id
  })

artist1.save()
artist2.save()
album1.save()
album2.save()

pry.binding
nil
