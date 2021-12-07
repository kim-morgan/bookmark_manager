require 'pg'

class Bookmarks
  def initialize
    @bookmarks = ["www.github.com", "www.google.com"]
  end

  def self.check_env
    if ENV['RACK_ENV'] == 'test'
      @conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      @conn = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.all
    list = ""
    Bookmarks.check_env
    @conn.exec("SELECT * FROM bookmarks") do |result|
      result.each do
        |row| list += "#{row.values_at('url')[0]}<br>"
      end
      return list
    end
  end

  def self.add(url)
    Bookmarks.check_env
    @conn.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")
  end
end