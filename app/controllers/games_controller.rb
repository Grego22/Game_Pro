class GamesController < ApplicationController
  before_action :find_game, only: [:show, :update, :edit, :destroy]
  def index
    @games = Game.all.order("created_at DESC")
  end
  def show
  end
  def new
    @game = Game.new
  end
  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  def show
  end
  def edit
  end

  def game_params
    params.require(:game).permit(:title, :description, :company)
  end
  def find_game
    @game = Game.find(params[:id])
  end
end
