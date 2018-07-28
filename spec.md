# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
-- Run by executing bin/wiki-cluster. Prompts the user for a wikipedia article url, and scrapes that page for relevant links.

- [x] Pull data from an external source
-- Pulls all links from the main body of a wikipedia article, and goes one level deeper into each link to pull. Creates a hash of the most linked articles from a given starting point.  

- [x] Implement both list and detail views
-- user is given a list of the top ten related links to a wikipedia site. User can then request a summary of any of the returned articles by typing '<index number>-details'
