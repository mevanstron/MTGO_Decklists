class MTGODecklists::MTGOEvent
  attr_accessor :name, :date, :decks, :url

  @@events = []

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

    event_count.times do |e|
      self.scrape_event(e)
    end

    #event_1 = self.scrape_event

    #event_2 = self.new
    #event_2.name = "Competitive Commander Constructed League"
    #event_2.date = "October 18, 2017"
    #event_2.decks = {}
    #event_2.url = "https://magic.wizards.com/en/articles/archive/mtgo-standings/competitive-commander-constructed-league-2017-10-18"

    self.all
  end

  def self.scrape_event(index)
    doc = Nokogiri::HTML(open("https://magic.wizards.com/en/content/deck-lists-magic-online-products-game-info"))

    event = self.create

    event.name = doc.css("div.article-item-extended")[index].css("div.title h3").text
    event.date = doc.css("div.article-item-extended")[index].css("div.title p").text.strip
    event.url = "https://magic.wizards.com#{doc.css("div.article-item-extended")[index].css("a").attribute("href").value}"

    event
  end
end
