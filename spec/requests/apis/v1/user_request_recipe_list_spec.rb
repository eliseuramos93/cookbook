require 'rails_helper'

feature 'GET api/v1/recipes/' do
  xit 'lista todas as receitas' do
    # arrange
    recipe_type = create(:recipe_type, name: 'Sobremesa')
    create(:recipe, title: 'Manjar', cook_time: 60,
                    recipe_type:,
                    ingredients: 'leite condensado, leite, leite de coco',
                    instructions: 'Misture tudo, leve ao fogo e mexa, leve a geladeira')
    recipe_type = create(:recipe_type, name: 'Lanche')
    create(:recipe, title: 'Hamburguer', cook_time: 10,
                    recipe_type:,
                    ingredients: 'hamburguer, pão de hamburguer, queijo',
                    instructions: 'Frite o hamburguer, coloque no pão, coma')

    # act
    get '/api/v1/recipes/'

    # assert
    expect(response).to have_http_status(200)
    expect(response.content_type).to include 'application/json'
  end

  pending 'filtra as receitas por nome ou tipo de receita'

  pending 'retorna um array vazio se não houverem receitas'

  pending 'avisa sobre um erro de servidor'
end