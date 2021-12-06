require 'bookmarks'
describe Bookmarks do
  context "#all" do
    it "should return a list of all bookmarks" do
      expect(Bookmarks.all).to eq "http://www.makersacademy.com/<br>http://www.google.com/<br>http://www.destroyallsoftware.com<br>"
    end
  end
end