require 'rails_helper.rb'

describe 'Editing Posts' do
    it 'can edit new posts' do
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

        # click edit post link
        click_link 'Edit'

        # visit specific route
        # #{post.id} to target ID
        post = Post.last
        visit "/posts/#{post.id}/edit"

        # fill in the form with the edited information
        fill_in 'Title', with: 'title2'
        fill_in 'Category', with: 'category2'
        fill_in 'Body', with: 'body2'
        
        # click submit button
        # form submit is automatically a button
        click_on 'Submit'

        # expect page to have the content we edited
        expect(page).to have_content('title2')
        expect(page).to have_content('category2')
        expect(page).to have_content('body2')
    end
end