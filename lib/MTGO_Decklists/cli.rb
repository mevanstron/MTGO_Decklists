class MTGODecklists::CLI

  def call
    puts "Welcome to the Magic the Gathering Online Standard Decklists App!"

    puts "Starting from the most recent, how many Competitive Standard Constructed League event results would you like to view?"

    input = gets.chomp.to_i

    while input < 1
      puts "Please enter a number greater than 0."
      input = gets.chomp.to_i
    end

    puts <<-DOC
      The 2 most recent events are dated:
        1. October 17, 2017
        2. October 16, 2017
    DOC
  end
end
