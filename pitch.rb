# TODO: Move all classes into seprate files once fleshed out

class Interface
	def initialize
		@deck_class = Deck.new
		@deck_class.deck
		@deck_class.shuffle
	end

	# Creates player object for each player and add into players array
	def create_players
		@player1 = Player.new(player_name(1), @deck_class.deal(5))
		@player2 = Player.new(player_name(2), @deck_class.deal(5))
		@players = [@player1, @player2]
	end

	private

	def player_name(index)
		puts "\nWhat's player #{index}'s name?"
		gets.chomp
	end
end

class Player
	attr_accessor :name, :hand, :score

	def initialize(name, hand)
		@name = name
		@hand = hand
		@score = 0
	end
end

class Deck
	# Set constants
	POWER = %w(2 3 4 5 6 7 8 9 10 J Q K A)
	SUITS = %w(spade heart club diamond)

	def initialize
		@deck = []
	end

	# Generates deck of 52 cards
	def deck
		POWER.each do |card_power|
			SUITS.each do |suite|
				@deck.push(card_power + ' ' + suite)
			end
		end
	end

	def shuffle
		@deck = @deck.shuffle
	end

	def deal(card_number)
		Array.new(card_number) { @deck.pop }
	end
end

pitch = Interface.new
pitch.create_players