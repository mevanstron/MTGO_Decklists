class MTGODecklists::MTGOEvent


  def self.recent_events



    puts <<-DOC
      The 2 most recent events are dated:
        1. October 17, 2017
        2. October 16, 2017
    DOC

    event_1 = self.new
    event_1.name = "Competitive Vintage Constructed League"
    event_1.date = "October 17, 2017"
    event_1.decks = {}

    event_2 = self.new
    event_2.name = "Competitive Commander Constructed League"
    event_2.date = "October 16, 2017"
    event_2.decks = {}

  end
end
