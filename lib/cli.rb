module WikiCluster

    class CLI

      def self.run(url = nil)
        # Prompts the user for a URL if not provided with one.
        if !url
          puts "Type or paste a Wikipedia link here: "
          url = gets.chomp
        end

        #  Initializes the starting point as a new Node instance, and scrapes all links from this starting point.
        root = Node.new(url)
        puts "\n#{root.links.length} links on this page. Searching each linked page for the most relevant articles..."
        if root.links.length > 250
          puts "(Because of the number of links, this may take a few minutes...)"
        end

        # For each link scraped from the base url, creates new Node instances and scrapes links from each of those.
        root.links.each do |link|
          Node.new('https://en.wikipedia.org' + link)
        end

        # counts the number of times each link appeared in the cluster of scraped links, and sorts them from most to least prevalent
        # returns the top ten results
        most_frequent = Cluster.most_frequent
        puts "\n ============================= \n\n"

        # Prints the top ten links to the terminal, and indicates how many times that link was found in the cluster
        most_frequent.each.with_index {|link, index| puts "#{index + 1}. https://en.wikipedia.org#{link[0]}\n   Linked #{link[1]} times in associated articles \n\n"}

        # prompts the user to click a link and be redirected to the article, indicate a link index and start the process over from there, or exit the program.
        puts "Click one of the links above to be redirected to the relevant Wikipedia artice."
        puts "Enter '[index number]-details' to see a summary of the wikipedia article contents (e.g. 1-details). "
        puts "Enter the index number to re-run the program using that link as a starting point."
        puts "Type 'exit' to close the program."

        input = gets.chomp

        case true
        when input.include?("details")
            index = input.split("-details")[0]
            link = "https://en.wikipedia.org" + most_frequent[index.to_i - 1][0]
            contents = Scraper.summary(link)
            puts link.split("wiki/")[1]
            puts link
            contents.each { |text| puts "- #{text}"}
        when input.match(/^\d+$/)
            puts "\n ============================= \n\n"
            puts "https://en.wikipedia.org" + most_frequent[input.to_i - 1][0]
            CLI.run("https://en.wikipedia.org" + most_frequent[input.to_i - 1][0])
        # when input == "exit"

        end


      end

    end


 end
