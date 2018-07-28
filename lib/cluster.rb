class Cluster


  def self.frequency_hash
    node_count = {}
    Node.all.each do |node|
      node.links.each do |link|
        if node_count.key?(link.to_sym)
          node_count[link.to_sym] += 1
        else
          node_count[link.to_sym] = 1
        end
      end
    end
    node_count.sort_by { |key, value| value}
  end

end
