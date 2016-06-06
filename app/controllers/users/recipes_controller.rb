class Users::RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_recipe, only: [:show, :edit, :update]
  def show
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
    @user = current_user
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @user = current_user
    @recipe.user = @user
    if @recipe.save!
      redirect_to recipe_path(@recipe), notice: 'Jouw nieuwe recept is geplaatst'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @recipe.update!(recipe_params)
    redirect_to profile_path, notice: 'Jouw recept is geupdate'
  end

  private
  def recipe_params
    params.require(:recipe).permit(
      :name,
      :summary,
      :description,
      :category,
      :kitchen,
      :course,
      :cooking_time,
      :prep_time,
      :photo,
      :photo_cache,
      ingredients_attributes: [:id, :name, :quantity, :unit, :_destroy])
  end

  def find_recipe
    @recipe = current_user.recipes.find(params[:id])
  end
end
