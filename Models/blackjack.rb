class Game
	def intialize(name)
		@name = name
		@players =["Ben", "Reis", "James", "Dean", "Daniel", "Ned"]
		if @players.include?(@name)
			@players.delete(@name)
		end
		@deck = (1..52).to_a.shuffle
		@your_hand = [@deck.shift, @deck.shift]
		@dealer_hand = [@deck.shift, @deck.shift]
		@score = (@your_hand[0]%13) + (@your_hand[1]%13)
		@dealer_score = (@dealer_hand[0]%13) + (@dealer_hand[1]%13)
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
		value = card%13
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
			@score = @score + (your_hand[2]%13)
			if @score > 21 
				return "bust"
				if @dealer_score > 21
					return "dealer busts"
				elsif @dealer_score<= 21
					return "dealer wins with a score of #{@dealer_score}"
				end
			elsif @score <=	21
				return @score
			end 	
		when "stand"
			return @score
			if @dealer_score <= @score && @dealer_score <= 16 
				@dealer_hand << @deck.shift
				@dealer_score = @dealer_score + (@dealer_hand[2]%13)
		end
	end
end
	#Here's our plan:
	#Assign values to each card. Give options Hit or Stand. Show one of the dealers cards
	#We might not actually include the dealer because that could be complicated
	#While playerScore != 21 do (for hitting)
	#We could also have a default of about 5 people at the table for simplicity
	#We probably can't do a split yet because that's hard
	#For HTML we could make each suit either red or black
	#We could maybe make like a repeat/loop command (I don't remember what it's called)
	#It will probably be a bunch of if or case statements

		