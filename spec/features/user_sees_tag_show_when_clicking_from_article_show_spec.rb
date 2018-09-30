require 'rails_helper'

describe 'user creates a new article and add a tag' do
  describe 'they link from the article index' do
    describe 'they link to tag from article show' do
      it 'displays tag data' do
        article_1 = Article.create!(title: "New Title 1", body: "New Body")
        tag_1 = article_1.tags.create!(name: "Name")

        article_2 = Article.create!(title: "New Title 2", body: "New Body")
        tag_2 = Tag.create!(name: "Name")
        article_2.tags << tag_2

        article_3 = Article.create!(title: "New Title 3", body: "New Body")
        tag_3 = Tag.create!(name: "Name")
        tagging = Tagging.create!(article_id: article_3.id, tag_id: tag_3.id)

        visit articles_path

        click_link article_1.title

        expect(page).to have_link(tag_1.name)

        click_link tag_1.name

        expect(current_path).to eq(tag_path(tag_1))
        expect(page).to have_content("Name")
      end
    end
  end
end
