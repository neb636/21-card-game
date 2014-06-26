# TODO: Move all classes into seprate files once fleshed out

class Interface
  Player = Struct.new(:name, :hand, :score)

  def initialize
    @deck_class = Deck.new
    @deck_class.deck
    @deck_class.shuffle
  end

  # Creates player object for each player
  def create_players
    @player1 = Player.new(player_name(1), @deck_class.deal(5), 0)
    @player2 = Player.new(player_name(2), @deck_class.deal(5), 0)
  end

  private

  def player_name(index)
    puts "\nWhat's player #{index}'s name?"
    gets.chomp
  end

  def show_hand(player)
    player.hand.each do |card|
      puts card.name
    end
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
    POWER.each do |power|
      SUITS.each do |suite|
        @deck.push(Card.new(power + ' ' + suite, suite, power))
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

class Card
  attr_accessor :name, :suite, :power

  def initialize(name, suite, power)
    @name = name
    @suite = suite
    @power = power
  end
end

pitch = Interface.new
pitch.create_players