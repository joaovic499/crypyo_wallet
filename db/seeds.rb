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