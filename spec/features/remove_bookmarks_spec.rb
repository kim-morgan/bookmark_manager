feature "removing bookmarks" do

  scenario "deleting one bookmark" do
    visit_page_add_bookmark
    click_button('Delete')
    expect(page).to have_no_content('Twitter')
  end

end