require 'bookmarks'
describe Bookmarks do

  before do
    conn = PG.connect(dbname: 'bookmark_manager_test')
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com/'), ('http://www.google.com/'), ('http://www.destroyallsoftware.com');")
  end

  context "#all" do
    it "should return a list of all bookmarks" do
      expect(Bookmarks.all).to include "http://www.makersacademy.com/"
      expect(Bookmarks.all).to include "http://www.google.com/"
      expect(Bookmarks.all).to include "http://www.destroyallsoftware.com"
    end
  end
end