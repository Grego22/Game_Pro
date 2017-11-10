class GamesController < ApplicationController
  before_action :find_game, only: [:show, :update, :edit, :destroy]
  def index
    @games = Game.all.order("created_at DESC")
  end
  def show
  end
  def new
    @game = current_user.game.build
  end
  def create
    @game = current_user.game.build(game_params)
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

  def update
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end
  def destroy
    @game.destroy
    redirect_to root_path
  end

  def game_params
    params.require(:game).permit(:title, :description, :company)
  end
  def find_game
    @game = Game.find(params[:id])
  end
end
