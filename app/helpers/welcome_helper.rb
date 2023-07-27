module WelcomeHelper

    def default_locale
        case I18n.default_locale.to_s
        when :en
          "Inglês dos Estados Unidos"
        when "pt-BR"
          "Português do Brasil"
        when "es-ES"
          "Espanhol"
        else
          "Error 404"
        end
      end
    end