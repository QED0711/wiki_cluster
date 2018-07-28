
require 'nokogiri'
require 'open-uri'

class Scraper

  def initialize(url)
    @url = url
  end

  def links_from_node
    valid_links = []
    html = open(@url)
    doc = Nokogiri::HTML(html)
    links = doc.css("p a")
    links.each do |link|
      href = link.attr("href")
      if href && href.include?("/wiki/") && !href.include?("Wikipedia:")
        valid_links << link.attr("href")
      end
    end
    valid_links
  end

end

# puts Scraper.new("https://en.wikipedia.org/wiki/Americas").links_from_node
