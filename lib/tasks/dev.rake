require "tty-spinner"

namespace :dev do
  desc "Configurando o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop)} 
      show_spinner("Criando BD...") { %x(rails db:create)} 
      show_spinner("Migrando BD...") { %x(rails db:migrate)} 
      %x(rails dev:add_coins) 
      %x(rails dev:add_mining_types)     
  else
    puts "Você não esta em ambiente de desenvolvimento!"

    end
  end

desc "Cadastra as moedas"
task add_coins: :environment do
  show_spinner("Cadastrando Moedas...") do
    coins = [
        {
            description: "Ethereum",
            acronym: "ETH",
            url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png",
        },
        {
            description: "Dash",
            acronym: "DASH",
            url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png",
        },
        {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://cryptologos.cc/logos/bitcoin-btc-logo.png",
        },
    ]

coins.each do |coin|
    Coin.find_or_create_by!(coin)
        end
      end
    end

    desc "Cadastro dos tipos de mineração"
    task add_mining_types: :environment do
      show_spinner("Cadastrando os Tipos de Mineração...") do
      mining_types = [
        {
            description: "Proof of Work",
            acronym: "PoW",
        },
        {
            description: "Proof of Stake",
            acronym: "PoS",
        },
  ]

  mining_types.each do |mining_type|
    MiningType.find_or_create_by!(mining_type)
      end  
    end
  end


  private

  def show_spinner(msg_start, msg_end = "Concluido!")

    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(Concluido!)")
    end
  end
