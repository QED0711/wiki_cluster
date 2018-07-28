class Node

  attr_accessor :url, :links

  @@all = []

  def initialize(url)
    @url = url
    @links = Scraper.new(@url).links_from_node
    @@all << self
  end

  def self.all
    @@all
  end
  #
  # def get_links
  #   self.links = Scraper.new(@url).links_from_node
  # end
  #
  # def print_links
  #   puts self.links
  # end
  #
  # def create_node_cluster
  #   self.links.each do |node|
  #     puts node
  #     puts Scraper.new("https://en.wikipedia.org" + node).links_from_node.count
  #   end
  # end

end
