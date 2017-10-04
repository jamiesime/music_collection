require_relative 'sql_runner.rb'
require_relative 'album.rb'

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(info)
    @id = info['id'].to_i if ['id']
    @name = info['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
          VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, "save_artist", values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    values = []
    SqlRunner.run(sql, "delete_artists", values)
   end

   def find_albums()
     sql = "SELECT * FROM albums WHERE artist_id = $1;"
     values = [@id]
     result = SqlRunner.run(sql, "find_artist", values)
     return result.map { |album| Album.new(album) }
   end



end
