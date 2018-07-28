
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
      str = link.attr("href")
      if str.include?("/wiki/") && !str.include?("Wikipedia:")
        valid_links << link.attr("href")
      end
    end
    valid_links
  end

end
