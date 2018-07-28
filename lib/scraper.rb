
require 'nokogiri'
require 'open-uri'

class Scraper
  attr_accessor :url
  def initialize(url)
    @url = url
    @html = open(@url)
  end

  def self.summary(url)
    contents = []
    html = open(url)
    doc = Nokogiri::HTML(html)
    contents_text = doc.css("span.toctext")
    contents_text.each do |element|
      contents << element.text
    end
    contents
  end

  def links_from_node
    valid_links = []
    doc = Nokogiri::HTML(@html)
    links = doc.css("p a")
    links.each do |link|
      href = link.attr("href")
      if href && href.include?("/wiki/") && !href.include?(":") && !href.include?("#")
        valid_links << link.attr("href")
      end
    end
    valid_links
  end

end

Scraper.summary("https://en.wikipedia.org/wiki/Medieval_music")
