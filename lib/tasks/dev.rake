require "tty-spinner"

namespace :dev do
  desc "Configurando o ambiente de desenvolvimento"
  task setup: :environment do
  if Rails.env.development?
  show_spinner("Apagando BD...") { %x(rails db:drop)} 
  show_spinner("Criando BD...") { %x(rails db:create)} 
  show_spinner("Migrando BD...") { %x(rails db:migrate)} 
  show_spinner("Populando BD...") { %x(rails db:seed)}     
  else
    puts "Você n~~ao esta em ambiente de desenvolvimento!"

    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluido!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end

