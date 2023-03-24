require 'rails_helper'

RSpec.describe 'group', type: :feature do
  describe 'index page' do
    before(:each) do
      visit user_session_path
      @dan = User.create!(name: 'Dan',
                          email: 'dan@gmail.com',
                          password: '1234567',
                          password_confirmation: '1234567')

      within('#new_user') do
        fill_in 'Email', with: 'dan@gmail.com'
        fill_in 'Password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'expect page path after sign in to be groups path' do
      expect(page).to have_current_path categories_path
    end

    it 'categories page shows the right content' do
      expect(page).to have_content('All Categories')
      expect(page).to have_content('Log out')
      expect(page).to have_link('Add a new category')
    end

    it 'clicking on add category link should go to add category page' do
      click_link 'Add a new category'
      expect(page).to have_current_path new_category_path
    end
  end
end
