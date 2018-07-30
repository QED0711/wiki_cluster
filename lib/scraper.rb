
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

