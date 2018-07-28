 module WikiCluster

   class CLI

     def self.run
       root = Node.new('https://en.wikipedia.org/wiki/Landini_cadence')

       root.links.each do |link|
         Node.new('https://en.wikipedia.org' + link)
       end

       count = Cluster.frequency_hash
       puts count

     end

   end


end
