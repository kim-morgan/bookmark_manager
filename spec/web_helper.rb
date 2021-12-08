def empty_database
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query("TRUNCATE bookmarks;")
end