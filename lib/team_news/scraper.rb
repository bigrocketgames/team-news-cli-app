class TeamNews::Scraper

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
    if slide_count != 0
      doc.css("ul.slider li").each do |i|
        puts

        headline = i.css("div.content h3 span:nth-child(2)").text.strip
      end
      # binding.pry
      count += 1
    end

    # doc.css("div.home-wrap div.base-note").each do |i|
    #   if count < 3
    #     puts count
    #
    #     # for the
    #     ad_detect = i.css("div.story-info div.under-title div.site-name").text.strip
    #     if ad_detect == ""
    #       puts "This is an ad"
    #     else
    #         headline = i.css("div.story-info h4.title span.title-text span").text.strip
    #         publisher = i.css("div.story-info div.under-title div.site-name").text.strip
    #         date = i.css("div.story-info div.under-title span.date").text.strip
    #         summary = i.css("div.story-info span.story-deck>span:first-child").text.strip
    #         link = i.at_css("a:first-child").attribute("href").value
    #         author = i.css("div.story-info span.story-deck span.author>span:nth-child(3)").text.strip
    #         subscription = i.css("div.story-info span.story-deck div.icon_key").to_s.match(/icon_key/).to_s == "icon_key" ? "True" : "False"
    #
    #         story = TeamNews::Story.new(headline, publisher, date, summary, link, author, subscription)
    #
    #         count += 1
    #     end
    #   end
    #
    #
    # end

  end


end
