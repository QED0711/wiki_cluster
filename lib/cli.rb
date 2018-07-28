 module WikiCluster

   class CLI

     def self.run
       root = Node.new('https://en.wikipedia.org/wiki/Landini_cadence')

       root.links.each do |link|
         Node.new('https://en.wikipedia.org' + link).links
       end
       puts Node.all.count
     end

   end


end
