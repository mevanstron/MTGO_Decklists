Event listing URL:
http://decks.tcgplayer.com/magic/deck/search?page=1&format=standard&latestset=ixalan&tags[0]=mtgo

App High Level Behavior:
  -Posts the top deck results of the 2 most recent MTGO Compettitive Standard League
  -Each Event Posting has a Post Date, and an array of Decklist objects
  -Each Deck has a name, a player, a date, an array of card objects for the main deck, an array of card ojbects for the sideboard

App Flow:
  - Asks user for number of Standard Tournaments whose results they would like to view.
  - Lists all tournamnets requested by Date.
  - Asks user which tournament's decklists they would like to view (individual or all).
  - Displays decklsits from requested tournaments.


Deck properties:
  - has card_name
  - has card_name count
  - has card types
  - has a MTGO user
  - has a Deck win record
  - has a sideboard
  - has a mainboard
  - has a display method that displays itself.

Card hash:
  -Key is card type
    -card type has card_names
      -card_names have a count
