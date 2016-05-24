require 'sinatra'
require_relative 'Models/blackjack.rb'
enable :sessions

get '/' do
	session[:game] = Game.new
	@hand = "You\'re hand is the #{session[:game].value(session[:game].your_hand[0])} and the #{session[:game].value(session[:game].your_hand[1])} for a score of #{session[:game].your_score}"
	@dealer = "#{session[:game].value(session[:game].dealer_hand[0])}"
	@context = "Do you stand or hit?"
	erb :index
	#b
end
post '/' do
	session[:game].play(params[:choice])
	case params[:choice]
	when "hit"
		@hand = "You\'re score is now #{session[:game].your_score}."
		@dealer = "#{session[:game].value(session[:game].dealer_hand[0])}"
		if session[:game].your_score > 21
			@dealer = nil
			@end = "You busted. The dealer wins with a score of #{session[:game].dealer_score}."
			erb :results
		else 
			@context = "Do you want to hit again?"
			erb :index
		end
	when "stand"
		@hand = "You\'re score is #{session[:game].your_score}."
		@dealer = "The dealer is showing a score of #{session[:game].dealer_score}."
		if (session[:game].dealer_score > 21) && (session[:game].your_score <= 21)
			@end = "The dealer busted, so you win."
		elsif (session[:game].your_score <= 21) && (session[:game].dealer_score <=21)
			if session[:game].your_score > session[:game].dealer_score
				@end = "You win!"
			else 
				@end = "The dealer wins."
			end
		end
		erb :results
	end	
end 