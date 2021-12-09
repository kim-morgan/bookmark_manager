feature "adding bookmarks" do

  scenario "adding one bookmark" do
    visit_page_add_bookmark
    expect(page).to have_content "Twitter"
    expect(page).to have_link("Twitter", :href => "http://www.twitter.com")
  end

end