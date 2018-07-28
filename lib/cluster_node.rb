class Node

  attr_accessor :url, :linkes

  @@all = []

  def initialize(url)
    @url = url
    @linkes = []
  end

  def get_links
    self.linkes = Scraper.new(@url).links_from_node
  end

  def print_linkes
    puts self.linkes
  end

  def create_node_cluster
    self.linkes.each do |node|
      puts node
      puts Scraper.new("https://en.wikipedia.org" + node).links_from_node.count
    end
  end

end
