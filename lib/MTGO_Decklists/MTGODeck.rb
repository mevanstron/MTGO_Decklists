class MTGODecklists::MTGODeck
  attr_accessor :cards, :user_wins

  @@all = []
  def initialize
    @cards = {}
  end

  def self.all
    @@all
  end

  def self.decklists(url)
    doc = Nokogiri::HTML(open(url))
    doc_decks = doc.css("div.decklists div").children

    doc_decks.each do |deck_data|
      deck = self.new
      deck.user_wins = deck_data.css("span.deck-meta h4").text.upcase

      card_types = deck_data.css("div.sorted-by-overview-container div:not(.regular-card-total)")

      card_types.each do |cards_by_type|
        type = cards_by_type.css("h5").text
        deck.cards[type] = []

        cards_by_type.css("span.card-name a").each do |card_name|

          deck.cards[type] << card_name.text
        end
      end
    end



    #card_types = doc.css("div.sorted-by-overview-container div:not(.regular-card-total)")
    #card_types.each do |cards_by_type|
      #type = cards_by_type.css("h5").text
      #cards_by_type.css("span.card-name a").each do |card_name|
        #deck.cards[type] = card_name.text
      #end
      #deck.cards["Creature (2)"] = doc.css("div.sorted-by-overview-container div:not(.regular-card-total)").first.css("span.card-name a").first.text
    #end

    #deck.user = "SPERLING"
    #deck.cards = {"Creature" => {"Dryad Arbor" => 1,"Dark Confidant" => 3}, "Sideboard" => {"Null Rod" => 1, "Swords to Plowshares" => 2}}
    #deck
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
