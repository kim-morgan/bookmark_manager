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
    DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES($1, $2);", [title, url])
  end

  def self.delete(id, comment_class = Comment, bookmark_tag_class = BookmarkTag)
    bookmark_tag_class.delete_by_bookmark(id)
    comment_class.delete_all(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id=$1;", [id])
  end

  def self.update(id, new_title, new_url)
    DatabaseConnection.query("UPDATE bookmarks SET title = $2, url = $3 WHERE id=$1;", [id, new_title, new_url])
  end

  def self.valid?(url)
    uri = URI.parse(url)
    uri.kind_of?(URI::HTTP) or uri.kind_of?(URI::HTTPS)
  end

  def comments(comment_class = Comment)
    comment_class.all(@id)
  end

  def tags(bookmark_tag_class = BookmarkTag, tag_class = Tag)
    tag_ids = bookmark_tag_class.find_by_bookmark(@id)
    tag_ids.map { |result| tag_class.find(result["tag_id"])}
  end

  def self.find(bookmark_id)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id=$1;", [bookmark_id])
    Bookmarks.new(result[0]["id"], result[0]["title"], result[0]["url"])
  end
end