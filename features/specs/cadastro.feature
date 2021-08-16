# language: pt
@cadastro
Funcionalidade: Cadastro
    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

    @success
    Cenario: Fazer cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome  | email                | senha  |
            | Bruno | bruno25leo@gmail.com | 123456 |
            | Gutts | gutts@berserk.com    | Casca  |
        Então sou redirecionado para o Dashboard

    @error
    Esquema do Cenario: Tentativa de Cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome   | email   | senha   |
            | <nome> | <email> | <senha> |
        Então vejo a mensagem de alerta: "<mensagem>"

        Exemplos:
            | nome  | email                | senha  | mensagem                         |
            |       | bruno25leo@gmail.com | 123456 | Oops. Informe seu nome completo! |
            | Bruno |                      | 123456 | Oops. Informe um email válido!   |
            | Bruno | bruno25leo%gmail.com | 123456 | Oops. Informe um email válido!   |
            | Bruno | bruno25leo@gmail.com |        | Oops. Informe sua senha secreta! |