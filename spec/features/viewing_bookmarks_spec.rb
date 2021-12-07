feature 'view bookmarks' do
  before do
    conn = PG.connect(dbname: 'bookmark_manager_test')
    Bookmarks.add('http://www.makersacademy.com/')
    Bookmarks.add('http://www.google.com/')
    Bookmarks.add('http://www.destroyallsoftware.com')
  end

  scenario 'user can view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content("http://www.makersacademy.com/http://www.google.com/http://www.destroyallsoftware.com")
  end
end