require 'rails_helper'

describe Tagging, type: :model do
  describe "relationships" do
    it do
      should belong_to(:tags)
    end
    it do
      should belong_to(:articles)
    end
  end
end
