require 'rails_helper'

describe 'user creates a new article' do
  describe 'they link to the new article form' do
    it 'displays new article form' do
      visit articles_path
      click_link "Create a New Article"

      expect(current_path).to eq(new_article_path)

      fill_in "article[title]", with: "New Title!"
      fill_in "article[body]", with: "New Body!"

      click_on "Create Article"

      #save_and_open_page

      expect(page).to have_content("New Title!")
      expect(page).to have_content("New Body!")


    end
  end
end