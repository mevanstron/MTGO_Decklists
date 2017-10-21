class MTGODecklists::MTGODeck
  attr_accessor :user_wins, :cards

  @@all = []
  def initialize
    @cards = {}
  end

  def self.all
    @@all
  end

  def save
    MTGODecklists::MTGODeck.all << self
  end

  def self.create
    self.new.tap{|deck| deck.save}
  end

  def self.decklists(url)
    self.scrape_deck(url)
  end

  def self.scrape_deck(url)
    doc = Nokogiri::HTML(open(url))
    doc_decks = doc.css("div.decklists").children

    doc_decks.collect do |deck_data|
      deck = self.create
      deck.user_wins = deck_data.css("span.deck-meta h4").text.upcase

      card_types = deck_data.css("div.sorted-by-overview-container div:not(.regular-card-total)")

      card_types.each do |cards_by_type|
        type = cards_by_type.css("h5").text
        deck.cards[type] = []

        cards_by_type.css("span.row").each do |card|
          deck.cards[type] << {"#{card.css("span.card-name a").text}" => card.css("span.card-count").text.to_i}
        end
      end

      sideboard = deck_data.css("div.sorted-by-sideboard-container")

      sideboard_title = sideboard.css("h5").text
      deck.cards[sideboard_title] = []

      sideboard.css("span.row").each do |card|
        deck.cards[sideboard_title] << {"#{card.css("span.card-name a").text}" => card.css("span.card-count").text.to_i}
      end
      deck
    end
  end

  def display
    puts "#{self.user_wins}"
    self.cards.each do |key, values|
      puts "\n#{key}"
      self.cards[key].each do |card|
        puts "#{card.values.join.to_i} #{card.keys.join}"
      end
    end
    puts "--------------"
  end
end
