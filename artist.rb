

class Artist

  def initialize(info)
    @id = info['id'].to_i if ['id']
    @name = info['name']
  end

  def save()
    sql = "INSERT INTO albums (name)
          VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, "save_artist", values)
    @id = result[0]['id'].to_i
  end

end
