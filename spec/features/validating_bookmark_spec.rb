feature 'Validating bookmarks' do
  scenario 'user cannot enter an invalid bookmark' do
    visit('/')
    fill_in('name', with: 'Twitter')
    fill_in('url', with: 'kim-is-amazing')
    click_button('Submit')
    fill_in('name', with: 'Twitter')
    fill_in('url', with: 'kim-is-happy')
    click_button('Submit')
    expect(page).to have_content('Please enter valid url')
  end
end