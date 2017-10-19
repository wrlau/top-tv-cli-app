class TopTv::CLI

  def call
    main_menu
    list_shows
    goodbye
  end

  def main_menu
    puts ""
    puts "Welcome to Top TV Shows!"
    puts ""
    #scrape categories, then list
    @headings = TopTv::Heading.all
    @headings.each.with_index(1) do |heading, i|
      puts "#{i}. #{heading.name}"
    end
  end

  def list_shows
    puts ""
    puts "Please enter the corresponding number or enter exit to quit:"
    input = gets.strip.downcase

    if input != "exit"
      puts ""
      heading = @headings[input.to_i-1]
      #scrape shows, then list
      the_shows = heading.shows.split(", ")
      the_shows.each.with_index(1) do |show, i|
        puts "#{i}. #{show}"
      end
      #binding.pry
      puts ""
      puts "What show would you like more info on?"

      input = gets.strip.to_i

      show = the_shows[input]
      puts "Is there another show that you'd like to learn more about? (y/n)"
      input = gets.strip.downcase
      if input == "y"
        main_menu
        list_shows
      end
    end

  end

  def goodbye
    puts "Goodbye!"
  end

end
