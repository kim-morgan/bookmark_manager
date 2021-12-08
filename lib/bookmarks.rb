require './lib/databaseconnection.rb'

class Bookmarks
  attr_reader :id, :title, :url
  def initialize(id,title,url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks") 
    result.map { |bookmark| Bookmarks.new(bookmark['id'],bookmark['title'],bookmark['url'])}
  end

  def self.add(title, url)
    if url[0..6] != "http://"
      url = "http://" + url
    end
    DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES($1, $2);", [title, url])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id=$1;", [id])
  end

  def self.update(id, new_title, new_url)
    DatabaseConnection.query("UPDATE bookmarks SET title = $2, url = $3 WHERE id=$1;", [id, new_title, new_url])
  end
end