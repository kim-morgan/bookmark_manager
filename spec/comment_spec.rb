require 'comment'
require 'bookmarks'

describe Comment do

  before do
    DatabaseConnection.query("ALTER SEQUENCE bookmarks_id_seq RESTART WITH 1;")
    Bookmarks.add("Twitter", "http://www.twitter.com")
  end

  context "#all"
    it "should be able to list all comments for a certain bookmark" do
      Comment.add("What a nice website!", 1)
      Comment.add("So useful!", 1)
      expect(Comment.all(1)[0].text).to eq "What a nice website!"
      expect(Comment.all(1)[1].text).to eq "So useful!"
    end

end