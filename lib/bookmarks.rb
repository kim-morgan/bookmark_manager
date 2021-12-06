class Bookmarks
  def initialize
    @bookmarks = ["www.github.com", "www.google.com"]
  end  

  def self.all
    ["www.github.com", "www.google.com"].join('<br>') 
  end
end