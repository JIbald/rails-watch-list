# require_relative '../models/bookmark.rb'

class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  #   @list = List.find(params[:id])
  #   @list.update(list_params)
  #   redirect_to list_path, status: :see_other
  # end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
