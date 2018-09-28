require 'rails_helper'

describe 'user edits article' do
  describe 'they link to the edit article form' do
    it 'displays edit article form and redirects to show article' do
      article = Article.create!(title: "Old title", body: "Old body")

      visit article_path(article)

      click_on "Edit"

      expect(current_path).to eq(edit_article_path(article))

      expect(page).to have_content('Edit ' + article.title)

      fill_in "article[title]", with: "New title"
      fill_in "article[body]", with: "New body"

      click_on "Update Article"

      expect(page).to have_content("New title")
      expect(page).to have_content("New body")
      expect(current_path).to eq(article_path(article))

      expect(page).to have_content("Article New title was updated.")

      # I have to reload the object
      article = Article.find(article.id)
      expect(article.title).to eq("New title")
    end
  end
end
