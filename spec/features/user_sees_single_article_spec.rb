require 'rails_helper'

describe "user sees one article" do
  describe 'they link from the articles index' do
    it 'displays article data' do
      article_1 = Article.create!(title: "New Article", body: "New Body")
      comment_1 = article_1.comments.create(author_name: "Me", body: "Commenty comments")
      comment_2 = article_1.comments.create(author_name: "You", body: "So much to say")

      visit articles_path

      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
      expect(page).to have_content("Your Name")
      expect(page).to have_content("Your Comment")
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
  describe "they fill in a comment form" do
    it "displays the comment on the article show" do
      article = Article.create!(title: "New Title", body: "New Body")

      visit article_path(article)

      fill_in "comment[author_name]", with: "ME!"
      fill_in "comment[body]", with: "So many thoughts on this article."
      click_on "Submit"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("ME!")
      expect(page).to have_content("So many thoughts on this article.")

      expect(page).to have_content("Comments (#{article.comments.size})")
    end
  end

end
