class TagsController < ApplicationController
  def create
    @tag = Tag.create(params.permit(:name)) # create = new + save
    render json: @tag.strip
  end

  # returns a list of all persistent tags
  def index
    @all = Tag.all
    render json: @all.collect{|tag| tag.strip}
  end

  def destroy
    Tag.find(params.permit(:id)[:id]).destroy
    render nothing: true, status: 200
  end

  # returns all tags whose name begin with the given prefix
  def prefix_search
    @tags = Tag.where("name LIKE :prefix", prefix: "#{params.permit(:s)[:s]}%")
    render json: @tags.collect{|tag| tag.strip}
  end
end
