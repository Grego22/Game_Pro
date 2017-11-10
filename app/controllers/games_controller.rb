class GamesController < ApplicationController
  before_action :find_game, only: [:show, :update, :edit, :destroy]
  def index
    @games = Game.all.order("created_at DESC")
  end
  def show
  end
  def new
    @game = current_user.games.build
    @catergories = Catergory.all.map{ |c| [c.name, c.id]}
  end
  def create
    @game = current_user.games.build(game_params)
    @game.catergory_id = params[:catergory_id]
    if @game.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  def show
  end
  def edit
    @catergories = Catergory.all.map{ |c| [c.name, c.id]}
  end

  def update
    @catergories = Catergory.all.map{ |c| [c.name, c.id]}
    
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
    params.require(:game).permit(:title, :description, :company, :catergory_id)
  end
  def find_game
    @game = Game.find(params[:id])
  end
end
