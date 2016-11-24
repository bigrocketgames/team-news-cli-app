class TeamNews::Scraper

  def nfl_team_scrape(team_url)
    doc = Nokogiri::HTML(open("#{team_url}"))
  end

end
