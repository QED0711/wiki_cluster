class Node

  attr_writer :url 
  attr_reader :links

  @@all = []

  def initialize(url)
    @url = url
    puts @url
    @links = Scraper.new(@url).links_from_node
    @@all << self
  end

  def self.all
    @@all
  end

end
