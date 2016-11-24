class TeamNews::Story
  attr_accessor :headline, :publisher, :date, :summary, :link, :subscription, :author
  @@all = []

  def initialize(headline, publisher, date, summary, link, author, subscription)
    @headline = headline
    @publisher = publisher
    @date = date
    @summary = summary
    @link = link
    @author = author
    @subscription = subscription
  end

  def self.story_list(url)
    doc = TeamNews::Scraper.new.team_scrape(url)
    slide_count = TeamNews::Scraper.new.number_of_slides(doc)
  end

  def self.all
    @@all
  end

end
