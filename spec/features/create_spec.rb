require 'rails_helper.rb'

describe 'Creating Posts' do
    it 'can create new posts' do
        # visit root route
        visit '/posts'

        # click create post link
        click_link 'Create Post'

        # fill in the form with needed information
        fill_in 'Title', with: 'title'
        fill_in 'Category', with: 'category'
        fill_in 'Body', with: 'body'

        # click submit button
        # form submit is automatically a button
        click_on 'Submit'

        # expect page to have the content we submitted
        expect(page).to have_content('title')
        expect(page).to have_content('category')
        expect(page).to have_content('body')
    end
end