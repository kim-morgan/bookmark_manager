feature "removing bookmarks" do

  scenario "deleting one bookmark" do
    visit('/')
    fill_in('name', with: 'Twitter')
    fill_in('url', with: "http://www.twitter.com")
    click_button('Submit')
    click_button('Delete')
    expect(page).to have_no_content('Twitter')
  end

end