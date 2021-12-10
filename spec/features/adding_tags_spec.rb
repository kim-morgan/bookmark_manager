feature 'adding tags' do
  scenario 'can add a tag to posts' do
    visit_page_add_bookmark
    click_button('Add tag')
    fill_in('content', with: 'social')
    click_button('Submit')
    expect(page).to have_content('social')
  end
end

feature 'seeing bookmarks by tag' do
  scenario 'can filter bookmarks by tag' do
    visit_page_add_bookmark
    visit_page_add_bookmark_1
    visit_page_add_bookmark_2
    page.all('.tag')[0].click
    fill_in('content', with: 'social')
    click_button('Submit')
    page.all('.tag')[1].click
    fill_in('content', with: 'social')
    click_button('Submit')
    click_link("social", match: :first)
    expect(page).to have_content("Twitter")
    expect(page).to have_content("Facebook")
    expect(page).to have_no_content("BBC")
  end
end