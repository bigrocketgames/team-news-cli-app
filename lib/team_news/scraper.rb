class TeamNews::Scraper
  attr_accessor :story

  # gets the HTML from the requested URL
  def team_scrape(team_url)
    doc = Nokogiri::HTML(open("#{team_url}"))
  end

  # gets the amount of slides in a slider based on the number of nav circles
  def number_of_slides(doc)
    count = 0
    doc.css("div.ep-nav ul li").each do |i|
      count += 1
    end
    return count
  end

  def scrape_for_stories(doc)
    slide_count = number_of_slides(doc)
    count = 0
    # while count < slide_count
    #   puts doc.search("li[data-index='#{count.to_s}'] a div.content h3[itemprop='headline'] span:last-child").text.strip
    #   binding.pry
    #   count += 1
    # end

    doc.css("div.home-wrap div.homestream div.base-note").each do |i|
      if count < 3
        puts count
        test = i.css("div.story-info div.under-title span.date").text.strip
        if test == ""
          puts "This is an ad"
        else
          puts test
        end
        # puts i.css("div.story-info div.under-title span.date").text.strip
        # puts i.css("div.story-info div.under-title div.site-name").text.strip
        # puts i.css("div.story-info h4.title span.title-text span").text.strip
      end
      count += 1
    end

  end


end
