# language: pt
@login
Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    @success
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "bruno25leo@gmail.com" e "123456"
        Então sou redirecionado para o Dashboard

    @error
    Esquema do Cenario: Tentativa de login
        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email>" e "<senha>"
        Então vejo a mensagem de alerta: "<mensagem>"

        Exemplos:
            | email                | senha  | mensagem                         |
            | bruno25leo@gmail.com | 222222 | Usuário e/ou senha inválidos.    |
            | bruno@gmail.com      | 123456 | Usuário e/ou senha inválidos.    |
            | bruno%gmail.com      | 123456 | Oops. Informe um email válido!   |
            |                      | 123456 | Oops. Informe um email válido!   |
            | bruno25leo@gmail.com |        | Oops. Informe sua senha secreta! |
