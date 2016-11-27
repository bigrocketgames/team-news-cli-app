class TeamNews::Story
  attr_accessor :headline, :publisher, :date, :summary, :link, :subscription, :author
  @@all = []

  def initialize(headline = nil, publisher = nil, date = nil, summary = nil, link = nil, author = nil, subscription = nil)

    if headline == nil
    else
      @headline = headline
      @publisher = publisher
      @date = date
      @summary = summary
      @link = link
      @author = author
      @subscription = subscription
      @@all << self
    end

  end

  def self.story_scrape(url)
    doc = TeamNews::Scraper.new.team_scrape(url)
    TeamNews::Scraper.new.scrape_for_stories(doc)
  end

  def self.all
    @@all
  end

  def self.story_list
    count = 1
    self.all.each do |story|
      puts "#{count}. #{story.headline} - #{story.subscription}"
      count += 1
    end
  end

end
