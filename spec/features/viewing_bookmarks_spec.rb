feature 'view bookmarks' do
  before do
    conn = PG.connect(dbname: 'bookmark_manager_test')
    Bookmarks.add("Makers Academy", 'http://www.makersacademy.com/')
  end

  scenario 'user can view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content("Makers Academy")
  end
end