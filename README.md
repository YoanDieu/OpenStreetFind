# OpenStreetFind

This Gem use nominatim (https://nominatim.openstreetmap.org/) from OpenStreetMap by default to find places and there details.
(geocodes, adresses, types etc...). It does not deal with quality of the result, it juste give it to you if one or more places are found.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_street_find', '~> 0.1.23' , github: "YoanDieu/OpenStreetFind"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install open_street_find

## Usage

Set the finder:

    '''

    finder = OpenStreetFind
    '''

Call a query method on your finder:

    '''

    result = finder.find(query)
    '''

query must be a string that would find result on https://nominatim.openstreetmap.org/
The gem do not deal with the presence of a valid result, you'll have to make sure that your
query is a valuable query on nominatim website. It will be parsed as a URI to generate your API call.

The result of queries are formated in an array of JSON.

## Other APIs/End point

You can configure an other Endpoint, for instance if you wish to use http://www.mapquest.com/ instead of OpenStreetMap nominatim service, simply configure an environnement variable like so:

    '''

    ENV["NOMINATIM_ENDPOINT"] = "http://open.mapquestapi.com/nominatim/v1"
    '''
    
The gem currently does not allow you to set an API Key, so it's only to be used on free request.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/open_street_find/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
