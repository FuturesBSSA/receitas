class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_recipe, only: [:favorite, :upvote]

  def index
    if params[:search]
      @recipes = Recipe.search(params[:search]).order('created_at DESC').page(params[:page]).per(3)
    else
      @recipes = Recipe.order('created_at DESC').page(params[:page]).per(3)
    end
  end

  def show
    @review = Review.new
    @recipe = Recipe.find(params[:id])
    @user = User.find(@recipe.user_id)
    @full_name = @recipe.user.first_name + " " + @recipe.user.last_name
    @reviews = @recipe.reviews.order('created_at DESC').page(params[:page]).per(3)
  end

  # Add and remove favorite recipes
  # for current_user
  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @recipe
      redirect_to :back, notice: 'Je hebt met succes dit recept toegevoegd aan jouw favorieten'

    elsif type == "unfavorite"
      current_user.favorites.delete(@recipe)
      redirect_to :back, alert: 'Je hebt met succes dit recept verwijderd aan jouw favorieten'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  # Add and remove vote
  # for current_user
  def upvote
    # you can upvote only once
    if !@recipe.votes.where(user: current_user).exists?
      @recipe.votes.where(user: current_user).first_or_create
    else
    # you can take your upvote back
      current_user.votes.where(user: current_user)
      @recipe.votes.where(user: current_user).first.destroy
    end
  end

  private
    def find_recipe
      @recipe = Recipe.find(params[:id])
    end
end
