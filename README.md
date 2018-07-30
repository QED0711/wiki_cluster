# WikiCluster

Welcome to the Wiki-Cluster Gem!

This gem allows users to quickly identify the most relevant topics related to any Wikipedia entry. The user only needs to provide a Wikipedia article as an entry point, and the gem will do the rest!    

## Installation

Fork and clone this repository.

cd into the repo, and run bundle install

    $ cd wiki_cluster-cli-app
    $ bundle install 

## Usage

The user provides a link to any Wikipedia article. e.g.

    $  https://en.wikipedia.org/wiki/Git

The gem will scrape all the links from the provided url, and then all the links from each of those urls. the gem checks the frequency with which these links appeared, and returns the ones that occured the most. Links are returned in the following format:

    $ https://wn.wikipedia.org/wiki/Linux
    $ Linked 43 times in associated articles

The user may click on any of the returned links to read the article directly. Alternatively, they my request details about a specified link, and read a summary of the contents in the CLI.

Users can also start a new relevance search from any of the returned links by simply typing the index of the link they wish to scrape.

NOTE: Because this gem has to load and parse several pages, sometime hundreds, pages with many links may take up to a minutes to scrape and find relevant articles.  

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'QED0711'/wiki_cluster.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
