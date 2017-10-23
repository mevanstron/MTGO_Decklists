# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application

    I've created a cli.rb file that houses the CLI class.  the executable, in a single line command, instantiates a new instance of the CLI and runs the #call method to run the program.

- [x] Pull data from an external source

    Data is pulled from https://magic.wizards.com/en/content/deck-lists-magic-online-products-game-info and sub-pages to list recent tournament event information.

- [x] Implement both list and detail views

    The CLI displays a list of recent events to the user who may then select one (or all) events.  This allows the user to  dive into and view the top performing decks for the event(s).
