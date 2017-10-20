class MTGODecklists::MTGODeck
  attr_accessor :cards, :user, :win_record

  def initialize
    @cards = {}

  def self.decklist(url)
    deck = self.new

    deck.user = "SPERLING"
    deck.cards = {"creature" => {"Dryad Arbor" => 1,"Dark Confidant" => 3}, "sideboard" => {"Null Rod" => 1, "Swords to Plowshares" => 2}}
    deck.win_record = "(5-0)"

  end

  def display
    puts "#{deck.user}"
    deck.cards.each do |key, values|
      puts "#{key}"
      key.each do |name, count|
        puts "#{count} #{name}"
      end
    end
  end

end

#self.cards = {
  #"creature" => {
    #"Dryad Arbor" => 1,"Dark Confidant" => 3
    #}
    #"sideboard" => {
      #"Null Rod" => 1, "Swords to Plowshares" => 2
    #}
  #}
