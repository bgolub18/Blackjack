class Game
	def initialize(name)
		@name = name
		@players =["Ben", "Reis", "James", "Dean", "Daniel", "Ned"]
		# if @players.include?(@name)
		# 	@players.delete(@name)
		# end
		@deck = (1..52).to_a.shuffle
		@your_hand = [@deck.shift, @deck.shift]
		@dealer_hand = [@deck.shift, @deck.shift]
		@score = ((@your_hand[0]-1)/4) + ((@your_hand[1]-1)/4)
		@dealer_score = ((@dealer_hand[0]-1)/4) + ((@dealer_hand[1]-1)/4)
	end
	def card=(card)
		case (card-1)/13
		when 0
			suit = "spades"
		when 1
			suit = "hearts"
		when 2
			suit = "diamonds"
		when 3
			suit = "clubs"
		end
		value = (card-1)/4
		case value
		when 1
			face = "Ace"
		when 11
			face = "Jack"
		when 12
			face = "Queen"
		when 0
			face = "King"	
		else
			face = value.to_s
		end 		
		return "#{face} of #{suit}" 
	end
	def play(choice)
		case choice
		when "hit"
			@your_hand << @deck.shift
			@score = @score + ((@your_hand[2]-1)/4)
			if @score > 21 
				return "You bust"
				if @dealer_score > 21
					return "dealer busts"
				elsif @dealer_score<= 21
					return "dealer wins with a score of #{@dealer_score}"
				end
			elsif @score <=	21
				return @score
			end 	
		when "stand"
			while ((@dealer_score <= @score) && (@dealer_score <= 16)) 
				@dealer_hand << @deck.shift
				@dealer_score = @dealer_score + ((@dealer_hand[2]-1)/4)
			end
		end
		if (@dealer_score > 21) && (@score<= 21)
			return "The dealer busts, and you win." 
		elsif (@score > 21) && (@dealer_score<= 21)
			return "You bust, and the dealer wins."
		elsif (@dealer_score <= 21) && (@score <= 21)
			if @score > @dealer_score 
				return "You win!"
			else 
				return "The dealer wins."
			end
			
		end	
	end
end