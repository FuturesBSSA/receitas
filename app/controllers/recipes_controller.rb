class RecipesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params[:search]
      @recipes = Recipe.search(params[:search]).page(params[:page]).per(3).order("created_at DESC")
    else
      @recipes = Recipe.page(params[:page]).per(3).order('created_at DESC')
    end
  end

  def show
    @review = Review.new
    @recipe = Recipe.find(params[:id])
    @user = User.find(@recipe.user_id)
    @full_name = @recipe.user.first_name + " " + @recipe.user.last_name
    @reviews = @recipe.reviews.page(params[:page]).per(3).order('created_at DESC')
  end

  # Add and remove favorite recipes
  # for current_user
  def favorite
    @recipe = Recipe.find(params[:id])
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
end
