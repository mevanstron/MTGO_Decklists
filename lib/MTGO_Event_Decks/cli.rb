class MTGOEventDecks::CLI

  def call
    puts "Welcome to the Magic the Gathering Online Event Decklists App!"
    puts "\nStarting from the most recent event, how many would you like to view (out of 6 total)?"

    input_1 = gets.chomp.to_i

    while !input_1.between?(1, 6)
      puts "Please enter a number between 1 and 6."
      input_1 = gets.chomp.to_i
    end

    puts "The most recent event(s):"

    @events = MTGOEventDecks::Event.recent_events(input_1)

    @events.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name} - #{event.date}"
    end

    puts "\nWhich event would you like to select for decklist viewing?"
    puts "Type in the number from the list above, or type 'all' to display all decks from all events."

    input_2 = gets.chomp

    while input_2 != "all" && !input_2.to_i.between?(1, input_1.to_i)
      puts "Please enter a number from the list of events or 'all'."
      input_2 = gets.chomp
    end

    if input_2.to_i > 0
      puts "\n//#{@events[input_2.to_i - 1].name}//\n\n"
      @events[input_2.to_i - 1].decks.each{|deck| deck.display}
    else
      @events.each do |event|
        puts "\n//#{event.name}//\n\n"
        event.decks.each{|deck| deck.display}
      end
    end
  end
end
