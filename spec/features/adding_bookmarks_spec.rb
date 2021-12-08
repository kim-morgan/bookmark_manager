feature "adding bookmarks" do

  scenario "adding one bookmark" do
    visit('/')
    fill_in('name', with: 'Twitter')
    fill_in('url', with: 'http://www.twitter.com')
    click_button('Submit')
    expect(page).to have_content "Twitter"
    expect(page).to have_link("Twitter", :href => "http://www.twitter.com")
  end

end