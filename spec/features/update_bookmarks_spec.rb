feature 'Update bookmarks' do
  scenario 'update one bookmark' do
    visit('/')
    fill_in('name', with: 'Twitter')
    fill_in('url', with: 'www.twitter.com')
    click_button('Submit')
    click_button('Update')
    fill_in('new_name', with: 'Facebook')
    fill_in('url', with: 'www.facebook.com')
    click_button('Update')
    expect(page).to have_no_content('Twitter')
    expect(page).to have_content('Facebook')
  end
end