class MTGODecklists::MTGODeck
  attr_accessor :cards, :user_wins

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

  def self.decklists(url)
    self.scrape_deck(url)
    self.all
  end

  def self.scrape_deck(url)
    doc = Nokogiri::HTML(open(url))
    doc_decks = doc.css("div.decklists").children

    doc_decks.each do |deck_data|
      deck = self.new
      deck.user_wins = deck_data.css("span.deck-meta h4").text.upcase

      card_types = deck_data.css("div.sorted-by-overview-container div:not(.regular-card-total)")

      card_types.each do |cards_by_type|
        type = cards_by_type.css("h5").text
        deck.cards[type] = []

        cards_by_type.css("span.row").each do |card|
          deck.cards[type] << {"#{card.css("span.card-name a").text}" => card.css("span.card-count").text.to_i}
        end
      end
      binding.pry
      deck.save
    end
  end

  def display
    puts "#{self.user} #{self.win_record}"
    self.cards.each do |key, values|
      puts "#{key}"
      self.cards[key].each do |name, count|
        puts "#{count} #{name}"
      end
    end
  end
end

#deck.cards = [Key]
