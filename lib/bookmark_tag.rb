class BookmarkTag

  attr_reader :id, :bookmark_id, :tag_id

  def initialize(id, bookmark_id, tag_id)
    @id = id
    @bookmark_id = bookmark_id
    @tag_id = tag_id
  end

  def self.add(bookmark_id, tag_id)
    result = DatabaseConnection.query("INSERT INTO bookmarks_tags (bookmark_id, tag_id) VALUES($1, $2) RETURNING bookmark_id, tag_id;", [bookmark_id, tag_id])
    BookmarkTag.new(result[0]['id'], result[0]['bookmark_id'], result[0]['tag_id'])
  end

  def self.find_by_bookmark(bookmark_id)
    DatabaseConnection.query("SELECT * FROM bookmarks_tags WHERE bookmark_id=$1;", [bookmark_id])
  end

  def self.find_by_tag(tag_id)
    DatabaseConnection.query("SELECT * FROM bookmarks_tags WHERE tag_id=$1;", [tag_id])
  end

  def self.delete_by_bookmark(bookmark_id)
    DatabaseConnection.query("DELETE FROM bookmarks_tags WHERE bookmark_id=$1;", [bookmark_id])
  end
  
end