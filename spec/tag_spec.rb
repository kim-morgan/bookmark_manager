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
    expect(Tag.find("1")).to eq "social"
    expect(Tag.find("2")).to eq "cooking"
  end

end