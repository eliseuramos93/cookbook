require 'rails_helper'

feature 'Usuário adiciona uma receita a sua lista de receitas' do
  scenario 'a partir da página de receitas' do
    # arrange
    user = create(:user, email: 'user@email.com', password: '123456', role: :user)
    create(:recipe_type, name: 'Sobremesa')
    recipe = create(:recipe, user: user)

    # act
    login_as user
    visit recipe_path(recipe.id)

    # assert
    expect(page).to have_link 'Adicionar à uma Lista de Receitas'
  end

  scenario 'com sucesso' do
    # arrange
    user = create(:user, email: 'user@email.com', password: '123456', role: :user)
    create(:recipe_type, name: 'Sobremesa')
    recipe_list = user.recipe_lists.create!(name: 'Doces que amo!')
    recipe = create(:recipe, user: user)

    # act
    visit recipe_path(recipe.id)
    click_on 'Adicionar à uma Lista de Receitas'
    
    select 'Doces que amo!', from: 'Lista de receitas'
    click_on 'Adicionar Receita'

    # assert
    expect(current_path).to eq recipe_list_path(recipe_list.id)
    expect(page).to have_content 'A receita foi adicionada com sucesso!'
    expect(page).to have_content 'Doces que amo!'
    expect(page).to have_link 'Brigadeiro'
  end
end
