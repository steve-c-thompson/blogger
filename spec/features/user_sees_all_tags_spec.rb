require 'rails_helper'

describe 'user sees all tags' do
  describe 'they visit /tags' do
    it 'displays all tags' do
      # create some tags
      tag_1 = Tag.create!(name: 'Tag1')
      tag_2 = Tag.create!(name: 'Tag2')

      visit tags_path

      expect(page).to have_link(tag_1.name)
      expect(page).to have_link(tag_2.name)

    end
  end

end
