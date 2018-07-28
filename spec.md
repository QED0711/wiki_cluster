# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
-- Run by executing bin/wiki-cluster. Prompts the user for a wikipedia article url, and scrapes that page for relevant links.

- [x] Pull data from an external source
-- Pulls all links from the main body of a wikipedia article, and goes one level deeper into each link to pull. Creates a hash of the most linked articles from a given starting point.  

- [ ] Implement both list and detail views
