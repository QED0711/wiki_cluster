class Cluster

  def self.frequency
    Node.all.each do |node|

      puts node.links

    end
  end

end
