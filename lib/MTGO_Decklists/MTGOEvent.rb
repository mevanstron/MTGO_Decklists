class MTGODecklists::MTGOEvent
  attr_accessor :name, :date, :decks, :url

  @@events = []

  def self.recent_events

    event_1 = self.new
    event_1.name = "Competitive Vintage Constructed League"
    event_1.date = "October 18, 2017"
    event_1.decks = {}
    event_1.url = "https://magic.wizards.com/en/articles/archive/mtgo-standings/competitive-vintage-constructed-league-2017-10-18"

    event_2 = self.new
    event_2.name = "Competitive Commander Constructed League"
    event_2.date = "October 18, 2017"
    event_2.decks = {}
    event_2.url = "https://magic.wizards.com/en/articles/archive/mtgo-standings/competitive-commander-constructed-league-2017-10-18"

    [event_1, event_2]
  end

  def self.scrape_event
    event = nil

    doc = Nokogiri::HTML(open("https://magic.wizards.com/en/content/deck-lists-magic-online-products-game-info"))

    event_1.url = doc.css("div.article-item-extended").first.css("a").attribute("href").value
    #go to events_url
    #extract properties
    #instantiate an event
    event
  end
end
#event =
#event_1.name =
