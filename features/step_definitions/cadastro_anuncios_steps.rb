Dado('Login com {string} e {string}') do |email, senha|
    @email = email

    @login_page.open
    @login_page.with(email, senha)
end

Dado('que acesso o formulario de cadastro de anúncios') do
    @dashboard_page.go_to_equipo_form
end

Dado('que tenha o seguinte equipamento:') do |table|
    @anuncio = table.rows_hash
    
    MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end
  
Quando('submeter o item para cadastro') do
    @equipos_page.create(@anuncio)
end

Então('o item deverá ser exibido no Dashboard') do
    expect(@dashboard_page.equipo_list).to have_content @anuncio[:nome]
    expect(@dashboard_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então('deve conter a mensagem de alerta: {string}') do |expect_alert|
    expect(@alert.dark).to have_text expect_alert
end
