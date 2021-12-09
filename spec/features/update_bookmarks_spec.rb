feature 'Update bookmarks' do
  scenario 'update one bookmark' do
    visit_page_add_bookmark
    click_button('Update')
    fill_in('new_name', with: 'Facebook')
    fill_in('url', with: 'http://www.facebook.com')
    click_button('Update')
    expect(page).to have_no_content('Twitter')
    expect(page).to have_content('Facebook')
  end
end