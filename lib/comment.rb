class Comment

  attr_reader :id, :text, :bookmark_id

  def initialize(id, text, bookmark_id)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end

  def self.add(text, bookmark_id)
    DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES($1, $2);", [text, bookmark_id])
  end

  def self.all(bookmark_id)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = $1;", [bookmark_id])
    result.map { |comment| Comment.new(comment['id'], comment['text'], comment['bookmark_id'])}
  end

end