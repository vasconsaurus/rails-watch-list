class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to list_path(bookmark.list)
    else
      render :new
    end
  end

  private
  def bookmarks_params
    params.require(:bookmark).permit(:comment)
  end

end
