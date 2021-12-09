require 'bookmarks'
require 'tag'

describe Bookmarks do

  context "#all"
    it "should return a list of all bookmarks" do
      Bookmarks.add('Makers Academy', 'http://www.makersacademy.com/')
      Bookmarks.add('Google', 'http://www.google.com/')
      expect(Bookmarks.all[0].title).to include "Makers Academy"
      expect(Bookmarks.all[1].title).to include "Google"
    end

  context "#add"
  it "should add a bookmark" do
    Bookmarks.add("Twitter", "http://www.twitter.com")
    expect(Bookmarks.all[0].title).to include "Twitter"
  end

  context "#delete"
    it "should delete a bookmark" do
      DatabaseConnection.query("ALTER SEQUENCE bookmarks_id_seq RESTART WITH 1;")
      Bookmarks.add("Twitter", "http://www.twitter.com")
      Bookmarks.delete(1)
      expect(Bookmarks.all).to be_empty
    end
  context '#update'
    it 'should update a bookmark' do
      DatabaseConnection.query("ALTER SEQUENCE bookmarks_id_seq RESTART WITH 1;")
      Bookmarks.add("Twitter", "http://www.twitter.com")
      Bookmarks.update(1, 'Facebook', 'http://www.facebook.com')
      expect(Bookmarks.all[0].title).to include 'Facebook' 
    end

  context '#validate'
    it 'should be able to tell if url is valid' do
      expect(Bookmarks.valid?('kim')).to be false
    end

  context '#tags'
  it 'should be able to show all tags' do
    DatabaseConnection.query("ALTER SEQUENCE bookmarks_id_seq RESTART WITH 1;")
    Bookmarks.add("Twitter", "http://www.twitter.com")
    Tag.add("social", 1)
    Tag.add("news", 1)
    expect(Bookmarks.new("1", "Twitter", "http://www.twitter.com").tags).to match_array ["social", "news"]
  end
end 