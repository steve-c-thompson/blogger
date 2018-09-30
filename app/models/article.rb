class Article < ApplicationRecord
  validates_presence_of :title, :body
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    self.tags.collect do |t|
      t.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    # split the tags to individuals
    #tags = tags_string.split(/,\s*/).uniq
    tag_names = tags_string.split(',').collect {|s| s.strip.downcase}.uniq
    # see if each already exists
    self.tags |= []
    tag_names.each do |tag|
      # t_obj = Tag.find_by(:name, tag)
      # if(!t_obj)
      #   t_obj = Tag.create(name: tag)
      # end
      t_obj = Tag.find_or_create_by(name: tag)
      # add the tag object to a list of tags for this article
      if(!self.tags.include? t_obj)
        self.tags << t_obj
      end
    end
    # set the article's tags to the list of tags
  end
  # this replaces the above method
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  self.tags = new_or_found_tags
  end
end
