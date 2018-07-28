# WikiCluster

Welcome to the Wiki-Cluster Gem!

This gem allows users to quickly identify the most relevant topics related to any Wikipedia entry. The user only needs to provide a Wikipedia article as an entry point, and the gem will do the rest!    

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wiki_cluster'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wiki_cluster

## Usage

The user provides a link to any Wikipedia article. e.g.

    $  https://en.wikipedia.org/wiki/Git

The gem will scrape all the links from the provided url, and then all the links from each of those urls. the gem checks the frequency with which these links appeared, and returns the ones that occured the most. Links are returned in the following format:



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'QED0711'/wiki_cluster.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
