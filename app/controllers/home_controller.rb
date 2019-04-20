class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    # Grab news data
    @url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN&api_key={1dd56854077b5378a533a6f87fa9f6c7b4468526398381b9a4962fa2dadd5821}'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @news = JSON.parse(@response)

    # Grab price data
    @prices_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,XRP,BCH,EOS,LTC,ADA,XLM&tsyms=USD,EUR&api_key={1dd56854077b5378a533a6f87fa9f6c7b4468526398381b9a4962fa2dadd5821}'
    @prices_uri = URI(@prices_url)
    @prices_response = Net::HTTP.get(@prices_uri)
    @prices = JSON.parse(@prices_response)


  end

  def prices
    require 'net/http'
    require 'json'
    @symbol = params[:sym]
    if @symbol
      @symbol = @symbol.upcase

      # Grab price data
      @quote_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=' + @symbol + '&tsyms=USD&api_key={1dd56854077b5378a533a6f87fa9f6c7b4468526398381b9a4962fa2dadd5821}'
      @quote_uri = URI(@quote_url)
      @quote_response = Net::HTTP.get(@quote_uri)
      @quote = JSON.parse(@quote_response)
    end
  end

end
