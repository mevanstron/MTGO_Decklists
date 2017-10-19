class MTGODecklists::MTGOEvent
  attr_accessor :name, :date, :decks, :url

  @@events_url = "https://magic.wizards.com/en/content/deck-lists-magic-online-products-game-info"

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

    puts <<-DOC
      The 2 most recent events are:
        1. #{event_1.name} - #{event_1.date}
        2. #{event_2.name} - #{event_2.date}
    DOC

  end
end
