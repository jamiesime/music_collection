require 'pry'
require_relative 'artist.rb'
require_relative 'album.rb'

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Tatsuro Yamashita'
  })

artist2 = Artist.new({
  'name' => 'Angel Olsen'
  })

artist1.save()
artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id(),
  'title' => 'Ride On Time',
  'genre' => 'City-Pop'
  })

album2 = Album.new({
  'artist_id' => artist2.id(),
  'title' => 'Burn Your Fire For No Witness',
  'genre' => 'Pop/Rock',
  })


album1.save()
album2.save()

binding.pry
nil
