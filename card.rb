class Card
  attr_accessor :rank, :suit
  
	def initialize(rank, suit)
    @rank = rank
    @suit = suit
	end
  
  def output_card 
    if self.rank === 1
      self.rank = 'Ace'
    elsif self.rank == 11
      self.rank = 'Jack'
    elsif self.rank == 12
      self.rank = 'Queen'
    elsif self.rank == 13
      self.rank = 'King'
    end
    
    if self.suit === 1
      self.suit = 'Diamond'
    elsif self.suit === 2
      self.suit = 'Clubs'
    elsif self.suit === 3
      self.suit = 'Hearts'
    elsif self.suit === 4
      self.suit = 'Spades'
    end
    puts "The #{self.rank} of #{self.suit}."
  end
  
  def self.random_card
    Card.new(rand(13) + 1, rand(4) + 1)
  end
end


class Deck
  def initialize
    @cards = []
    4.times do |suit| 
      13.times do |rank|
        @cards << Card.new(rank + 1, suit + 1)
      end
    end
  end
  
  def shuffle
    @cards.shuffle!
  end
  
  def output
    @cards.each do |card|
      card.output_card
    end
  end
  
  def deal
    card = @cards.shift
    return card
  end
  
  def count 
    return @cards.count
  end
end

deck = Deck.new
deck.shuffle
deck.output

puts 'Deal!'
puts deck.deal.output_card
puts "Cards left in deck: #{deck.count}"