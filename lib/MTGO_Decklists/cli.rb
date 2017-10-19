class MTGODecklists::CLI

  def call
    puts "Welcome to the Magic the Gathering Online Standard Decklists App!"

    puts "Starting from the most recent, how many Competitive Standard Constructed League event results would you like to view?"

    input_1 = gets.chomp

    while input_1.to_i < 1
      puts "Please enter a number greater than 0."
      input_1 = gets.chomp
    end

    puts <<-DOC
      The 2 most recent events are dated:
        1. October 17, 2017
        2. October 16, 2017
    DOC
  end

  puts "Which tournament would you like to select for decklist viewing?  Type in the number from the list above, or type 'all' to display all decklists."

  input_2 = gets.chomp

  while (input_2 != "all" && input_2.to_i < 0) || input_2.to_i > input_1.to_i
    puts "Please enter a number from the list of events or 'all'."
    input_2 = gets.chomp.to_i
  end

  puts "Displaying Decklists"
end
