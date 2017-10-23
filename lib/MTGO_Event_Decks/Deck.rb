class MTGOEventDecks::Deck
  attr_accessor :user_wins, :event
  attr_accessor :cards

  @@decks = []

  def initialize
    @cards = {}
  end

  def self.all
    @@decks
  end

  def save
    MTGOEventDecks::Deck.all << self
  end

  def self.create
    self.new.tap{|deck| deck.save}
  end

  def self.event_decks(url, event)
    self.scrape_deck(url, event)
  end

  def self.scrape_deck(url, event)
    doc = Nokogiri::HTML(open(url))
    doc_decks = doc.css("div.decklists").children

    doc_decks.collect do |deck_data|
      deck = self.create
      deck.user_wins = deck_data.css("span.deck-meta h4").text.upcase
      deck.event = event
      deck.cards = deck_data

      deck
    end
  end

  def cards=(deck_data)
    card_types = deck_data.css("div.sorted-by-overview-container div:not(.regular-card-total)")
    sideboard = deck_data.css("div.sorted-by-sideboard-container")

    card_types.each do |cards_by_type|
      @cards[cards_by_type.css("h5").text] = []
      cards_by_type.css("span.row").each do |card|
        @cards[cards_by_type.css("h5").text] << {"#{card.css("span.card-name a").text}" => card.css("span.card-count").text.to_i}
      end
    end

    @cards[sideboard.css("h5").text] = []
    sideboard.css("span.row").each do |card|
      @cards[sideboard.css("h5").text] << {"#{card.css("span.card-name a").text}" => card.css("span.card-count").text.to_i}
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
