feature 'Validating bookmarks' do
  scenario 'user cannot enter an invalid bookmark' do
    visit('/')
    fill_in('name', with: 'Twitter')
    fill_in('url', with: 'kim-is-amazing')
    click_button('Submit')
    expect(page).to have_content('Please enter valid url')
  end

  scenario 'user cannot update a bookmark with invalid url' do
    visit_page_add_bookmark
    click_button('Update')
    fill_in('new_name', with: 'Facebook')
    fill_in('url', with: 'lalala')
    click_button('Update')
    expect(page).to have_content('Please enter valid url')
    expect(page).to have_content('Twitter')
    expect(page).to have_no_content('Facebook')
  end
end