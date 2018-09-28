require 'rails_helper'

describe 'user deletes article' do
  describe 'they link from the show page' do
    it 'displays all articles without the deleted entry' do
      article_1 = Article.create(title: 'New title 1', body: "New body 1")
      article_2 = Article.create(title: 'New title 2', body: "New body 2")

      visit article_path(article_1)

      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      #expect(page).to_not have_content(article_1.title)
      expect(page).to have_content("Article New title 1 deleted.")

    end
  end
end
