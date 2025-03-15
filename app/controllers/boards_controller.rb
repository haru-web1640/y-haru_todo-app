class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @boards = Board.order(created_at: :desc) # 作成日時で降順ソート
  end

  def show
  end


  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params) # current_user に紐付けて生成
    if @board.save
      redirect_to board_path(@board), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board), notice: '更新できたよ'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    board = current_user.articles.find(params[:id])
    board.destroy!
    redirect_to boards_path, notice: '削除できたよ'
  end

  private
  def board_params
    params.require(:board).permit(:name, :description)
  end

  # 共通処理として set_board を追加
  def set_board
    @board = Board.find(params[:id])
  end
end
