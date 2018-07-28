 module WikiCluster

   class CLI

     def self.run
       root = Node.new('https://en.wikipedia.org/wiki/Landini_cadence')

       root.links.each do |link|
         Node.new('https://en.wikipedia.org' + link)
       end

       Cluster.frequency
      #  counter = 0
      #  Node.all.each {|node| puts "#{counter+= 1} : #{node.links}"}
     end

   end


end
