require 'sinatra'
require_relative 'Models/blackjack.rb'
enable :sessions

get '/' do
	session[:game] = Game.new
	@hand = "You\'re hand is the #{session[:game].value(session[:game].your_hand[0])} and the #{session[:game].value(session[:game].your_hand[1])} for a score of #{session[:game].your_score}"
	@context = "The dealer is showing a #{session[:game].value(session[:game].dealer_hand[0])}, do you stand or hit?"
	erb :index
end
post '/' do
	session[:game].play(params[:choice])
	case params[:choice]
	when "hit"
		@hand = "You\'re score is now #{session[:game].your_score}."
		if session[:game].your_score > 21
			@end = "You busted. The dealer wins with a score of #{session[:game].dealer_score}."
			erb :results
		else
		end
	end

	
end 