require 'bookmarks'
describe Bookmarks do

  before do
    @conn = PG.connect(dbname: 'bookmark_manager_test')
  end

  context "#all"
    it "should return a list of all bookmarks" do
      Bookmarks.add('http://www.makersacademy.com/')
      Bookmarks.add('http://www.google.com/')
      expect(Bookmarks.all).to include "http://www.makersacademy.com/"
      expect(Bookmarks.all).to include "http://www.google.com/"
    end

  context "#add"
  it "should add a bookmark" do
    Bookmarks.add("www.twitter.com")
    expect(Bookmarks.all).to include "www.twitter.com"
  end
end