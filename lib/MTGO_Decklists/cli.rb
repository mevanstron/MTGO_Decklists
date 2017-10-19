class MTGODecklists::CLI

  def call
    puts "Welcome to the Magic the Gathering Online Event Decklists App!"

    puts "Starting from the most recent, how many Event results would you like to view?"

    input_1 = gets.chomp.to_i

    while input_1 < 1
      puts "Please enter a number greater than 0."
      input_1 = gets.chomp.to_i
    end

    puts "The 2 most recent events are"
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

    puts "Displaying Decklists"
  end
end
