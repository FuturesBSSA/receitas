class ProfilesController < ApplicationController
  def show
    @fullname = current_user.first_name + " " + current_user.last_name
    @recipes = current_user.recipes.page(params[:recipes_page]).order("created_at DESC")
    @favorites = current_user.favorites.page(params[:favorites_page]).order("created_at DESC")
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update!(user_params)
    redirect_to profile_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :photo, :photo_cache)
  end
end

