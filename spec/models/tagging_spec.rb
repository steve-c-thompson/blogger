require 'rails_helper'

describe Tagging, type: :model do
  describe "relationships" do
    it do
      should belong_to(:tag)
    end
    it do
      should belong_to(:article)
    end
  end
end
