class Bookmarks
  def initialize
    @bookmarks = ["www.github.com", "www.google.com"]
  end  

  def all
    @bookmarks.join('<br>') 
  end
end