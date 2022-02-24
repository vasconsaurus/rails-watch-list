class ListsController < ApplicationController
  def index
    List.all
  end
end
