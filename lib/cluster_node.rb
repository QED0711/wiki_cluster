class Cluster_Node

  attr_accessor :url, :nodes

  def initialize(url)
    @url = url
    @nodes = []
  end

  def get_nodes
    scraper = Scraper.new(@url)
    self.nodes = scraper.links_from_node
  end

  def print_nodes
    puts self.nodes
  end

  def create_node_cluster
    self.nodes.each do |node|
      puts Scraper.new("https://en.wikipedia.org" + node).links_from_node.count
    end
  end

end
