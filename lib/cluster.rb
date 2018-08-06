class Cluster

   def self.frequency_hash
     node_count = {}

     Node.all.each do |node|
      node.links.each do |link|
        if link #prevents nil links from making their way into the counting mechanics
          if node_count.key?(link)
            node_count[link] += 1
          else
            node_count[link] = 1
          end
        end
      end
    end
    node_count.sort_by { |key, value| value}.reverse
   end

   def self.top_ten_links
     hash = Cluster.frequency_hash
     (0..9).map do |index|
      hash[index]
     end

   end

 end
