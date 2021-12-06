feature 'view bookmarks' do
  scenario 'user can view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content("www.github.com")
  end
end