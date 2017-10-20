class MTGODecklists::MTGODeck
  attr_accessor :cards, :user, :win_record

  def initialize
    @card = {}

  def self.decklists(url)
    deck = self.new

    deck.user = "SPERLING"
    deck.card = {"creature" => {"Dryad Arbor" => 1,"Dark Confidant" => 3}, "sideboard" => {"Null Rod" => 1, "Swords to Plowshares" => 2}}
    deck.win_record = "(5-0)"
    deck.sideboard = nil
    deck.mainboard = nil

  end
end

#self.cards = {"creature" => {"Dryad Arbor" => 1,"Dark Confidant" => 3}}
