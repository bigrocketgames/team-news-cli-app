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
    puts count
  end



end
