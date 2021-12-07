feature "adding bookmarks" do
  before do
    @conn = PG.connect(dbname: 'bookmark_manager_test')
  end

  scenario "adding one bookmark" do
    visit('/')
    fill_in('name', with: 'www.twitter.com')
    click_button('Submit')
    expect(page).to have_content "www.twitter.com"
  end

end