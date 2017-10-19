class MTGODecklists::CLI

  def call
    puts "Welcome to the Magic the Gathering Online Event Decklists App!"

    puts "Starting from the most recent event, how many would you like to view (out of 6 total)?"

    input_1 = gets.chomp.to_i

    while !input_1.between?(1, 6)
      puts "Please enter a number between 1 and 5."
      input_1 = gets.chomp.to_i
    end

    puts "The #{input_1} most recent events are"
    @events = MTGODecklists::MTGOEvent.recent_events(input_1)
    @events.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name} - #{event.date}"
    end

    puts "Which tournament would you like to select for decklist viewing?  Type in the number from the list above, or type 'all' to display all decklists."

    input_2 = gets.chomp

    while (input_2 != "all" && (input_2.to_i < 1 || input_2.to_i > input_1.to_i))
      puts "Please enter a number from the list of events or 'all'."
      input_2 = gets.chomp
    end

    @eventdecks = @events[input_2.to_i].decks
    puts "Displaying Decklists"
  end
end
