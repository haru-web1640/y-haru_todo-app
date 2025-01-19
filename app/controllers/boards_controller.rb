class BoardsController < ApplicationController
  # ApplicationControllerを継承

  def index
    @boards = Board.all
  end

  def edit
  end

end