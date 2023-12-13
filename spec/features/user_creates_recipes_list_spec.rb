require 'rails_helper'

feature 'Usuário cria lista de receitas' do
  scenario 'apenas se autenticado' do
    # arrange
    
    # act
    visit new_recipe_list_path

    # assert
    expect(current_path).to eq new_user_session_path
  end

  scenario 'a partir da página inicial' do
    # arrange
    user = create(:user, email: 'user@email.com', password: '123456', role: :user)

    # act
    login_as user
    visit root_path
    click_on 'Criar Nova Lista de Receitas'

    # assert
    expect(current_path).to eq new_recipe_list_path
    expect(page).to have_content 'Criar nova lista de receitas'
    expect(page).to have_field 'Nome'
    expect(page).to have_button 'Criar Lista de Receitas'
  end

  scenario 'com sucesso' do
    # arrange
    user = create(:user, email: 'user@email.com', password: '123456', role: :user)

    # act
    login_as user
    visit new_recipe_list_path
    fill_in 'Nome', with: 'Receitas Natalinas'
    click_on 'Criar Lista de Receitas'

    # assert
    expect(page).to have_content 'Lista de receita cadastrada com sucesso'
    expect(page).to have_content 'Receitas Natalinas'
    expect(page).to have_content 'Essa lista ainda não possui receitas!'
  end
end