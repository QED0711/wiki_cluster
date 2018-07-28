class Cluster

   def self.frequency_hash
     node_count = {}
     Node.all.each do |node|
       node.links.each do |link|
         if node_count.key?(link)
           node_count[link] += 1
         else
           node_count[link] = 1
         end
       end
     end
     node_count.sort_by { |key, value| value}.reverse
   end

   def self.most_frequent
     top_links = []
     index = 0
     hash = Cluster.frequency_hash
     (0..9).each do |i|
       top_links << hash[i]
       index = i
     end

     while top_links[-1][1] == hash[index][1] && top_links[-1][0] != hash[index][0]
       top_links << hash[index]
       index += 1
     end

     top_links

   end

 end
