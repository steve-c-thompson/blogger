# app/controllers/tags_controller.rb
class TagsController < ApplicationController
  before_action :set_tag, only: [:destroy, :show]

  def index
    @tags = Tag.all
  end
  def show
    #@tag = Tag.find(params[:id])
  end

  def destroy
    # Delete taggings
    Tagging.where(tag_id: @tag.id).destroy_all
    @tag.destroy
    flash.notice = "Tag #{@tag.name} deleted."
    redirect_to tags_path
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end
end
