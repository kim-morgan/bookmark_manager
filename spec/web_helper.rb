def empty_database
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query("TRUNCATE comments, bookmarks, tags, bookmarks_tags;")
end

def visit_page_add_bookmark
  visit('/')
  fill_in('name', with: 'Twitter')
  fill_in('url', with: 'http://www.twitter.com')
  click_button('Submit')
end

def visit_page_add_bookmark_1
  visit('/')
  fill_in('name', with: 'Facebook')
  fill_in('url', with: 'http://www.facebook.com')
  click_button('Submit')
end

def visit_page_add_bookmark_2
  visit('/')
  fill_in('name', with: 'BBC')
  fill_in('url', with: 'http://www.bbc.com')
  click_button('Submit')
end