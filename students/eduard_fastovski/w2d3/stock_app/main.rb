require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoofinance'
require 'active_support/all'

get '/' do
  # if params[:symbol].nil? && !params[:symbol].empty?
    if params[:symbol].present?
      @symbol = params[:symbol].upcase
      @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
    end
  erb :quote
end

post '/' do

end
