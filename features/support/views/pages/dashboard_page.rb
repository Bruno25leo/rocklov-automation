class DashboardPage
    include Capybara::DSL

    def on_dash?
        page.has_css?('.dashboard')
    end

    def go_to_equipo_form
        return click_button "Criar anúncio"
    end

    def equipo_list
        find(".equipo-list")
    end
end