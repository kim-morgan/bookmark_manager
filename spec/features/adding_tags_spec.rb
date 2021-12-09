feature 'adding tags' do
  scenario 'can add a tag to posts' do
    visit_page_add_bookmark
    click_button('Add tag')
    fill_in('content', with: 'social')
    click_button('Submit')
    expect(page).to have_content('social')
  end
end