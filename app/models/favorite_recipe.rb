class FavoriteRecipe < ApplicationRecord
  belongs_to :recipe_list
  belongs_to :recipe
end
