require 'pg'

class Bookmarks
  attr_reader :id, :title, :url
  def initialize(id,title,url)
    @id = id
    @title = title
    @url = url
  end

  def self.check_env
    if ENV['RACK_ENV'] == 'test'
      @conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      @conn = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.all
    Bookmarks.check_env
    result = @conn.exec("SELECT * FROM bookmarks") 
    test = result.map { |bookmark| Bookmarks.new(bookmark['id'],bookmark['title'],bookmark['url'])}
  end

  def self.add(title, url)
    Bookmarks.check_env
    if url[0..6] != "http://"
      url = "http://" + url
    end
    @conn.exec_params("INSERT INTO bookmarks (title, url) VALUES($1, $2);", [title, url])
  end

  def self.delete(id)
    Bookmarks.check_env
    @conn.exec_params("DELETE FROM bookmarks WHERE id=$1;", [id])
  end

  def self.update(id, new_title, new_url)
    Bookmarks.check_env
    @conn.exec_params("UPDATE bookmarks SET title = $2, url = $3 WHERE id=$1;", [id, new_title, new_url])
  end
end