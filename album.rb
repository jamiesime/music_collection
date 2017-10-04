
class Album

  def initialize(info)
    @id = info['id'].to_i if ['id']
    @title = info['title'],
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


end
