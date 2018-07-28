
require 'nokogiri'
require 'open-uri'

class Scraper
  # CALENDAR = "https://theclarice.umd.edu/calendar"
  def self.links_from_root
    valid_links = []
    html = open("https://en.wikipedia.org/wiki/Late_Middle_Ages")
    doc = Nokogiri::HTML(html)
    # puts doc
    links = doc.css("p a")
    links.each do |link|
      str = link.attr("href")
      if str.include?("/wiki/") && !str.include?("Wikipedia:")
        valid_links << link.attr("href")
      end
    end
    puts valid_links
  end

end
