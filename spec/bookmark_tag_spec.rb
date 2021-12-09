require 'bookmark_tag' 

describe BookmarkTag do

  before do
    DatabaseConnection.query("ALTER SEQUENCE bookmarks_id_seq RESTART WITH 1;")
    DatabaseConnection.query("ALTER SEQUENCE tags_id_seq RESTART WITH 1;")
    Bookmarks.add("Twitter", "http://www.twitter.com")
    DatabaseConnection.query("INSERT INTO tags (content) VALUES($1);", ["social"])
  end

  it "should be able to add bookmark to tag relation" do
    result = BookmarkTag.add(1,1)

    expect(result).to be_a_kind_of BookmarkTag
    expect(result.bookmark_id).to eq "1"
    expect(result.tag_id).to eq "1"
  end

end