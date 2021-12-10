require_relative './bookmark_tag.rb'

class Tag

  attr_reader :id, :content

  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.add(content, bookmark_id, bookmark_tag_class = BookmarkTag)
    if Tag.exists?(content)
      result = DatabaseConnection.query("SELECT * FROM tags WHERE content=$1;", [content])
      BookmarkTag.add(bookmark_id, result[0]['id'])
      Tag.new(result[0]['id'], result[0]['content'])
    else
      result = DatabaseConnection.query("INSERT INTO tags (content) VALUES($1) RETURNING id, content;", [content])
      BookmarkTag.add(bookmark_id, result[0]['id'])
      Tag.new(result[0]['id'], result[0]['content'])
    end
  end

  def self.exists?(tag)
    result = DatabaseConnection.query("SELECT exists (SELECT 1 FROM tags WHERE content = $1 LIMIT 1);", [tag])
    result[0]["exists"] == "t"
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM tags WHERE id=$1;", [id])
    Tag.new(result[0]["id"],result[0]['content'])
  end

  def bookmarks(bookmark_class= Bookmarks, bookmark_tag_class = BookmarkTag)
    bookmark_ids = bookmark_tag_class.find_by_tag(@id)
    result = bookmark_ids.map { |relation| bookmark_class.find(relation["bookmark_id"]) }
  end
  
end