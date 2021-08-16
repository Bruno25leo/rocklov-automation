
Dado('que acesso a página de cadastro') do                                   
    @signup_page.open
end                                                                          
                                                                               
Quando('submeto o meu cadastro completo') do

    MongoDB.new.remove_user("bruno25leo@gmail.com")

    find("#fullName").set "Bruno Ribeiro" 
    find("#email").set "bruno25leo@gmail.com"
        find("#password").set "123456"

    click_button "Cadastrar"
end

Quando('submeto o seguinte formulário de cadastro:') do |table|
    user = table.hashes.first
    
    MongoDB.new.remove_user(user[:email])

    @signup_page.create(user)
end

