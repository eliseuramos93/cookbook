class FavoriteRecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new]

  def new
    # vc já tava esquecendo: como você vai mandar o id da receita pra cá?
    # não dá tempo de fazer session. vc não fez o recurso nestado.
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_lists = current_user.recipe_lists
    @favorite_recipe = FavoriteRecipe.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite_recipe = @recipe.favorite_recipes.build(favorite_recipe_params)

    if @favorite_recipe.save
      redirect_to root_path, notice: 'Receita adicionada à lista com sucesso'
    end
  end

  private

  def favorite_recipe_params
    params.require(:favorite_recipe).permit(:recipe_list_id)
  end
end


