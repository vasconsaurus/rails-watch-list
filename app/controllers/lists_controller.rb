class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # o mesmo que: @bookmark = Bookmark.new(list_id: @list.id)
    @bookmark = @list.bookmarks.new
    @review = @list.reviews.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
