require 'tag'

describe Tag do

  before do
    DatabaseConnection.query("ALTER SEQUENCE bookmarks_id_seq RESTART WITH 1;")
    DatabaseConnection.query("ALTER SEQUENCE tags_id_seq RESTART WITH 1;")
    Bookmarks.add("Twitter", "http://www.twitter.com")
  end

  context "#add"
  it "should be able to add a tag" do
    result = Tag.add("social", 1)
    expect(result).to be_a_kind_of Tag
    expect(result.content).to eq "social"
  end

  context "#existence_check"
  it "should be able to check if a tag exists" do
    Tag.add("social", 1)
    expect(Tag.exists?("social")).to be true
  end

  context "#find tag"
  it "should be able to find tag by id" do
    Tag.add("social", 1)
    Tag.add("cooking", 1)
    expect(Tag.find("1").content).to eq "social"
    expect(Tag.find("2").content).to eq "cooking"
  end

  context "#bookmarks"
  it "should be able to display bookmarks by tag" do
    Bookmarks.add("Facebook", "http://www.facebook.com")
    Tag.add("social", 1)
    Tag.add("social", 2)
    tag = Tag.new(1, "social")
    expect(tag.bookmarks[0].title).to eq "Twitter"
    expect(tag.bookmarks[0].url).to eq "http://www.twitter.com"
    expect(tag.bookmarks[1].title).to eq "Facebook"
    expect(tag.bookmarks[1].url).to eq "http://www.facebook.com"
  end

end