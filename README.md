# MTGOEvent_Decks

MTGO Event_Decks offers a user access to view information from Magic The Gathering Online' recent tournaments.  A user may view a list of the most recent events (up to 6).  They may then select which event's top performing decks they would like to view.  Once displayed, the decks will show details including the user, their win record, and cards arranged by type.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'MTGO_Event_Decks'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install MTGO_Event_Decks

## Usage

Once welcomed, the user inputs the amount of recent events they would like to view in list form (User enters 1 - 6).

The terminal will print a list of events.

The user is then prompted to select either the specific event for which they would like to view top performing decks, or they may select 'all' to view all decks from all events (User enters 1 - 6, or 'all').

The terminal will then print deck lists pertaining to the chosen events.

End of program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'mevanstron'/MTGO_Event_Decks.
