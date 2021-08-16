#language: pt
@cadastro_anuncio
Funcionalidade: Cadastro de anúncios
    Sendo um usuário cadastrado do Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibiliza-los para locação

    Contexto: Login
        * Login com "bruno@bruno.com" e "pwd123"

    @success
    Cenario: Novo equipamento
        Dado que acesso o formulario de cadastro de anúncios
            E que tenha o seguinte equipamento:
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
            | imagem    | fender-sb.jpg |
        Quando submeter o item para cadastro
        Então o item deverá ser exibido no Dashboard

    @temp @equipo_sem_foto
    Esquema do Cenario: Anúncio sem foto
        Dado que acesso o formulario de cadastro de anúncios
            E que tenha o seguinte equipamento:
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
            | imagem    | <foto>      |
        Quando submeter o item para cadastro
        Então deve conter a mensagem de alerta: "<saida>"

        Exemplos:
            | foto          | nome              | categoria | preco | saida                                |
            |               | Violao de Nylon   | Cordas    | 150   | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |                   | Outros    | 250   | Informe a descrição do anúncio!      |
            | mic.jpg       | Microfone Shure   |           | 100   | Informe a categoria                  |
            | trompete.jpg  | Trompete Clássico | Outros    |       | Informe o valor da diária            |
            | conga.jpg     | Conga             | Outros    | abc   | O valor da diária deve ser numérico! |
            | conga.jpg     | Conga             | Outros    | 12a   | O valor da diária deve ser numérico! |
