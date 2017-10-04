require_relative 'sql_runner.rb'
require_relative 'artist.rb'

class Album

  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(info)
    @id = info['id'].to_i if ['id']
    @title = info['title']
    @genre = info['genre']
    @artist_id = info['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
          VALUES ($1, $2, $3) RETURNING id;"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, "save_album", values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    values = []
    SqlRunner.run(sql, "delete_albums", values)
   end

  def self.list_all()
    sql = "SELECT * FROM albums;"
    values = []
    result = SqlRunner.run(sql, "list_all", values)
    return result.map {|album| Album.new(album)}
  end

  def find_artist()
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    result = SqlRunner.run(sql, "find_artist", values)
    return result[0]
  end


end
