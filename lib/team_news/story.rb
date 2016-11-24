class TeamNews::Story
  attr_accessor :headline, :publisher, :date, :summary, :link, :sub, :author
  @@teamScraper = TeamNews::Scraper.new
  stories = []

  def self.story_list(url)
    doc = @@teamScraper.team_scrape(url)
    slide_count = @@teamScraper.number_of_slides(doc)
  end

end
