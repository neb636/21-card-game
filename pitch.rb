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
  # The difference in power and game_point is power is a cards value when thrown and
  # game_point is how much a card is worth after the hand when counting game points
  Card = Struct.new(:name, :suite, :power, :game_point)

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
        @deck.push(Card.new(power + ' ' + suite, suite, set_power(power), set_game_point(power)))
      end
    end
  end

  def shuffle
    @deck = @deck.shuffle
  end

  def deal(card_number)
    Array.new(card_number) { @deck.pop }
  end

  private

  def set_power(power)
    case power
    when 'J'
      return 11
    when 'Q'
      return 12
    when 'K'
      return 13
    when 'A'
      return 14
    else
      return power.to_i
    end
  end

  # In pitch when counting game cards are not given their normal value.
  # Set point value accordingly.
  def set_game_point(power)
    case power
    when '10'
      return 10
    when 'J'
      return 1
    when 'Q'
      return 2
    when 'K'
      return 3
    when 'A'
      return 4
    else
      return 0
    end
  end
end

pitch = Interface.new
pitch.create_players