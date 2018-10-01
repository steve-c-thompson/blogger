require 'rails_helper'

describe 'user deletes tag' do
  describe 'they link to tag from all tags and click delete ' do
    it 'deletes the tag and displays all tags without the entry' do
      tag_1 = Tag.create!(name: "Tag 1 Delete")
      tag_2 = Tag.create!(name: "Tag 2 Delete")

      article_1 = Article.create!(title: "New title 1", body: "New body 1")
      article_2 = Article.create!(title: "New title 2", body: "New body 2")

      tagging = Tagging.create!(article_id: article_1.id, tag_id: tag_1.id)

      visit tags_path

      # save_and_open_page

      expect(page).to have_link(tag_1.name)
      expect(page).to have_link(tag_2.name)

      click_link tag_1.name

      expect(current_path).to eq(tag_path(tag_1))

      click_link "Delete"

      expect(current_path).to eq(tags_path)

      expect(current_path).to_not have_content(tag_1.name)

      expect(page).to have_content("Tag #{tag_1.name} deleted.")

    end
  end
end
