class MTGODecklists::MTGODeck
  attr_accessor :card_name, :card_name_count, :cards, :user, :win_record, :sideboard, :mainboard

  def initialize
    @card = {}

  def self.decklists(url)
    deck = self.new

    deck.user = "SPERLING"
    deck.card = {}
    deck.win_record = "(5-0)"
    deck.sideboard = nil
    deck.mainboard = nil

  end
end
