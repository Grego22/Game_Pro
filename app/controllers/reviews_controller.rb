class ReviewsController < ApplicationController
  before_action :find_game
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    @game = Game.find(params[:game_id])
    @review = Review.new(review_params)
    @review.game_id = @game.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end

  def destroy
    @game.destroy
      redirect_to game_path(@game)


  end

private

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
    def find_game
      @game = Game.find(params[:game_id])
    end
    def find_review
      @review = Review.find(params[:id])
    end

end
