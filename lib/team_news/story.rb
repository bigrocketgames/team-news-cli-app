class TeamNews::Story
  attr_accessor :headline, :publisher, :date, :summary, :link, :subscription, :author
  @@all = []

  def initialize(headline = nil, publisher = nil, date = nil, summary = nil, link = nil, author = nil, subscription = nil)
    @headline = headline
    @publisher = publisher
    @date = date
    @summary = summary
    @link = link
    @author = author
    @subscription = subscription
  end

  def self.story_scrape(url)
    doc = TeamNews::Scraper.new.team_scrape(url)
    TeamNews::Scraper.new.scrape_for_stories(doc)
  end

  def self.all
    @@all
  end

  def self.story_list
    self.all.each do |story|

    end
  end

end
