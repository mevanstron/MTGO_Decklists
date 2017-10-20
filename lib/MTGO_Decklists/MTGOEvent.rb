class MTGODecklists::MTGOEvent
  attr_accessor :name, :date, :decks, :url

  @@events = []

  def initialize
    @decks = []
  end

  def self.all
    @@events
  end

  def save
    MTGODecklists::MTGOEvent.all << self
  end

  def self.create
    self.new.tap{|event| event.save}
  end

  def self.recent_events(event_count)
    event_count.times{|e| self.scrape_event(e)}
    self.all
  end

  def self.scrape_event(index)
    doc = Nokogiri::HTML(open("https://magic.wizards.com/en/content/deck-lists-magic-online-products-game-info"))

    event = self.create
    event.name = doc.css("div.article-item-extended")[index].css("div.title h3").text
    event.date = doc.css("div.article-item-extended")[index].css("div.title p").text.strip
    event.url = "https://magic.wizards.com#{doc.css("div.article-item-extended")[index].css("a").attribute("href").value}"

    event.decks << MTGODecklists::MTGODeck.decklist(event.url)
    event
  end
end
