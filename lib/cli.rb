module WikiCluster

    class CLI

      def self.run(url = nil)

        if !url
          puts "Type or paste a Wikipedia link here: "
          url = gets.chomp
        end

        root = Node.new(url)
        puts "#{root.links.length} links on this page. Creating cluster and searching frequency..."

        root.links.each do |link|
          Node.new('https://en.wikipedia.org' + link)
        end

       most_frequent = Cluster.most_frequent

       puts "\n ============================= \n\n"

       most_frequent.each.with_index {|link, index| puts "#{index + 1}. Linked #{link[1]} times in cluster: https://en.wikipedia.org#{link[0]}\n\n"}

       puts "Click one of the links above, or enter the associated number to re-run the program from that link. (press ENTER/RETURN to exit)"

       input = gets.chomp

       puts most_frequent[input.to_i - 1][0]
       CLI.run("https://en.wikipedia.org" + most_frequent[input.to_i - 1][0])
      end

    end


 end
