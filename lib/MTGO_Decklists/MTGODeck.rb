class MTGODecklists::MTGODeck
  attr_accessor :cards, :user_wins

  def initialize
    @cards = {}
  end

  def self.decklist(url)
    doc = Nokogiri::HTML(open(url))

    deck = self.new
    deck.user_wins = doc.css("div.deck-group").first.css("span.deck-meta h4").text.upcase

    deck.cards["Creature (2)"] = doc.css("div.sorted-by-overview-container").first.css("span.name a").attribute("href").text



    #deck.user = "SPERLING"
    deck.cards = {"Creature" => {"Dryad Arbor" => 1,"Dark Confidant" => 3}, "Sideboard" => {"Null Rod" => 1, "Swords to Plowshares" => 2}}
    deck.win_record = "(5-0)"
    deck
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

#self.cards = {
  #"creature" => {
    #"Dryad Arbor" => 1,"Dark Confidant" => 3
    #}
    #"sideboard" => {
      #"Null Rod" => 1, "Swords to Plowshares" => 2
    #}
  #}
