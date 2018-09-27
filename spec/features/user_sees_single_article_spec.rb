require 'rails_helper'

describe "user sees one article" do
  describe 'they link from the articles index' do
    it 'displays article data' do
      article_1 = Article.create!(title: "New Article", body: "New Body")
      visit articles_path

      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
    end
  end

  describe 'they visit the articles page with an id' do
    it 'displays article data' do
      article_1 = Article.create!(title: "New Article", body: "New Body")

      # visit "/articles/#{article_1.id}"
      visit article_path(article_1)

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)

    end
  end


end
