require 'databaseconnection'

describe DatabaseConnection do

  it "should setup a connection to the database" do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
    DatabaseConnection.setup('bookmark_manager_test')
  end

  it "should have a persistent connection" do
    test_connection = DatabaseConnection.setup('bookmark_manager_test')
    expect(DatabaseConnection.connection).to eq test_connection
  end

  context ".query"

  it "executes a query" do
    connection = DatabaseConnection.setup('bookmark_manager_test')
    expect(connection).to receive(:exec_params).with("SELECT * FROM bookmarks where id=1", [])
    DatabaseConnection.query("SELECT * FROM bookmarks where id=1")
  end

end
