class EquiposPage
    include Capybara::DSL

    def create(equipo)
        page.has_css? '#equipoForm'
        
        upload(equipo[:imagem]) if equipo[:imagem].length > 0
        
        find("#name").set equipo[:nome]
        select_cat(equipo[:categoria]) if equipo[:categoria].length > 0
        find("#price").set equipo[:preco]

        click_button "Cadastrar"
    end

    def upload(filename)
        diretorio = Dir.pwd + "/features/support/fixtures/images/" + filename
        
        find("#thumbnail input[type=file]", visible: false).set diretorio
    end

    def select_cat(categoria)
        find("#category").find("option", text: categoria).select_option
    end
end
