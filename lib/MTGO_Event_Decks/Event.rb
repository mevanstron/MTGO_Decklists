class MTGOEventDecks::Event
  attr_accessor :name, :date, :decks, :url

  @@events = []

  def initialize
    @decks = []
  end

  def self.all
    @@events
  end

  def save
    MTGOEventDecks::Event.all << self
  end

  def self.create
    self.new.tap{|event| event.save}
  end

  def self.recent_events(event_count)
    self.scrape_events(event_count)
    self.all
  end

  def self.scrape_events(event_count)
    doc = Nokogiri::HTML(open("https://magic.wizards.com/en/content/deck-lists-magic-online-products-game-info"))

    event_count.times do |i|
      event = self.create
      event.name = doc.css("div.article-item-extended")[i].css("div.title h3").text
      event.date = doc.css("div.article-item-extended")[i].css("div.title p").text.strip
      event.url = "https://magic.wizards.com#{doc.css("div.article-item-extended")[i].css("a").attribute("href").value}"
      event.decks = MTGOEventDecks::Deck.decklists(event.url)
    end
  end
end
