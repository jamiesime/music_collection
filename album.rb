
class Album

  def initialize(info)
    @id = info['id'].to_i if ['id']
    @title = info['title'],
    @genre = info['genre']
    @artist_id = info['artist_id'].to_i
  end

end
