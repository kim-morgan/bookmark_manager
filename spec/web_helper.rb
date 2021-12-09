def empty_database
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query("TRUNCATE comments, bookmarks;")
end

def visit_page_add_bookmark
  visit('/')
  fill_in('name', with: 'Twitter')
  fill_in('url', with: 'http://www.twitter.com')
  click_button('Submit')
end