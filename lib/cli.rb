module WikiCluster

    class CLI

      def self.run(url = nil)

        if !url
          puts "Type or paste a Wikipedia link here: "
          url = gets.chomp
        end

        root = Node.new(url)
        puts "\n#{root.links.length} links on this page. Searching each linked page for the most relevant articles..."
        if root.links.length > 250
          puts "(Because of the number of links, this may take a few minutes...)"
        end

        root.links.each do |link|
          Node.new('https://en.wikipedia.org' + link)
        end

       most_frequent = Cluster.most_frequent

       puts "\n ============================= \n\n"

       most_frequent.each.with_index {|link, index| puts "#{index + 1}. Linked #{link[1]} times in associated articles: https://en.wikipedia.org#{link[0]}\n\n"}

       puts "Click one of the links above, or enter the associated number to re-run the program using that link as a starting point. (press ENTER/RETURN to exit)"

       input = gets.chomp
       if input != ""
         puts "\n ============================= \n\n"
         puts "https://en.wikipedia.org" + most_frequent[input.to_i - 1][0]
         CLI.run("https://en.wikipedia.org" + most_frequent[input.to_i - 1][0])
       end
      end

    end


 end
