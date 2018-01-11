# ClashRoyale

This is a Ruby wrapper of the popular [CR API](https://cr-api.com/)

> **Note**: In order to be able to use the API, you would need a developer key. You can get a
developer key by following instructions listed on
[CR API website](http://docs.cr-api.com/#/authentication)

`ClashRoyale` gem tries to keep the same attribute names from the JSON input into plain ruby
objects.

Where in the original api we see `camelCase` we change it to a more _rubyish_ `snake_case`, so
`requiredScore` becomes `required_score`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clash_royale'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clash_royale

## Usage

After you get an API key then you can configure `ClashRoyale` to use it:

```ruby
ClashRoyale.configure do |config|
  config.token = YOUR_TOKEN
end
```

Note that all code below assumes that you first run the configure block.

#### API Version

You can check the remote API version:

```ruby
ClashRoyale.api_version
=> "7.11.6"
```

#### Clan information

```ruby
clan = ClashRoyale::Clan.find('Q882899')

clan.name
# => "Raisparta"

clan.description
# => This is my wonderful clan.

clan.donations
# => 15462

clan.chest_active?
# => false

clan.required_score
# => 4000

clan.score
# => 41418

clan.tag
# => "Q882899"

clan.type
# => "invite only"

clan.open?
# => false

# clan.members will have a list of ClanMember objects
clan.members.first.name
# => "Rikas"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rikas/clash_royale.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
