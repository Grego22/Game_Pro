class GamesController < ApplicationController
  def index
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
end
