class RecipeListsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  
  def new
    @recipe_list = RecipeList.new
  end

  def create
    @recipe_list = current_user.recipe_lists.build(recipe_list_params)
    

    if @recipe_list.save
      flash[:notice] = t('.success')
      redirect_to @recipe_list
    end
  end

  def show
    @recipe_list = RecipeList.find(params[:id])
  end

  private

  def recipe_list_params
    params.require(:recipe_list).permit(:name)
  end
end