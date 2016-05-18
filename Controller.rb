require 'Sinatra'
require_relative 'Models/blackjack.rb'
enable :sessions

get '/' do
	session[:game] = Game.new
	@hand = "You\'re hand is the #{session[:game].value(@your_hand[0])} and the #{session[:game].value(@your_hand[1])} for a score of #{@score}"
	@context = "The dealer is showing a #{session[:game].value(@dealer_hand[0])}, do you stand or hit?"
end
post '/' do
	session[:game].play(params[:choice])
end 