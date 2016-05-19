class Game
	attr_accessor :your_hand, :dealer_hand, :your_score, :dealer_score
	def initialize
		#@name = name
		#@players =["Ben", "Reis", "James", "Dean", "Daniel", "Ned"]
		# if @players.include?(@name)
		# 	@players.delete(@name)
		# end
		@deck = (1..52).to_a.shuffle
		@your_hand = [@deck.shift, @deck.shift]
		@dealer_hand = [@deck.shift, @deck.shift]
		@your_score = 0
		@your_hand.each do |card|
			@your_score += score(card)
		end
		@dealer_score = 0
		@dealer_hand.each do |card|
			@dealer_score += score(card)
		end
	end
	def score(card)
		case (card-1)/4
		when 0 
			value = 10
		when 11
			value = 10
		when 12
			value = 10
		else
			value = (card-1)/4
		end
		return value
	end

	def value(card)
		case (card-1)/13
		when 0
			suit = "Spades"
		when 1
			suit = "Hearts"
		when 2
			suit = "Diamonds"
		when 3
			suit = "Clubs"
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
			@your_score = 0
			@your_hand.each do |card|
				@your_score += score(card)
			end
			if @your_score > 21 
				return "You bust"
				if @dealer_score > 21
					return "dealer busts"
				elsif @dealer_score<= 21
					return "dealer wins with a score of #{@dealer_score}"
				end
			end 	
		when "stand"
			while ((@dealer_score <= @your_score) && (@dealer_score <= 16)) 
				@dealer_hand << @deck.shift
				@dealer_score = 0
				@dealer_hand.each do |card|
					@dealer_score += score(card)
				end
			end
		end
	end
end