require 'bookmarks'
describe Bookmarks do

  before do
    @conn = PG.connect(dbname: 'bookmark_manager_test')
  end

  context "#all"
    it "should return a list of all bookmarks" do
      Bookmarks.add('Makers Academy', 'http://www.makersacademy.com/')
      Bookmarks.add('Google', 'http://www.google.com/')
      expect(Bookmarks.all[0].title).to include "Makers Academy"
      expect(Bookmarks.all[1].title).to include "Google"
    end

  context "#add"
  it "should add a bookmark" do
    Bookmarks.add("Twitter", "www.twitter.com")
    expect(Bookmarks.all[0].title).to include "Twitter"
  end
end