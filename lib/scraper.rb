
require 'nokogiri'
require 'open-uri'

class Scraper
  attr_reader :html
  
  def initialize(url)
    @html = open(url)
  end

  def summary
    doc = Nokogiri::HTML(@html)
    contents = doc.css("span.toctext")

    contents.collect do |section_heading|
      section_heading.text
    end
  end

  def links_from_node
    doc = Nokogiri::HTML(@html)
    links = doc.css("p a")

    links.map do |link|
      href = link.attr("href")
      if href && href.include?("/wiki/") && !href.include?(":") && !href.include?("#")
        href
      end
    end
  end

end

