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
    doc_event = doc.css("div.article-item-extended")[index]

    event = self.create.tap
    event.name = doc_event.css("div.title h3").text
    event.date = doc_event.css("div.title p").text.strip
    event.url = "https://magic.wizards.com#{doc_event.css("a").attribute("href").value}"

    event.decks = MTGODecklists::MTGODeck.decklists(event.url)

    event
  end
end