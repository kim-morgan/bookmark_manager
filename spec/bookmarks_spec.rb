require 'bookmarks'
describe Bookmarks do
  context "#all" do
    it "should return a list of all bookmarks" do
      expect(subject.all).to eq "www.github.com<br>www.google.com"
    end
  end
end