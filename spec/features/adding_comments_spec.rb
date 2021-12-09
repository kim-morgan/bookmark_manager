feature 'adding comments' do
  scenario 'user should be able to add one comment to a bookmark' do
    visit_page_add_bookmark
    click_button('Comment')
    fill_in('text', with: "Kim's fave website!")
    click_button('Comment')
    expect(page).to have_content("Kim's fave website!")
  end
end