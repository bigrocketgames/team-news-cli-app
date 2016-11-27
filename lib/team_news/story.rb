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

  def self.reset
    @@all.clear
  end

  def self.story_list
    count = 1
    self.all.each do |story|
      puts "#{count}. #{story.headline} - #{story.subscription}"
      puts "    Published by: #{story.publisher} - Date Published: #{story.date} - Written By: #{story.author}"
      count += 1
    end
  end

  def self.read_story(story_number)
    story = self.all[story_number]
    if story.subscription == "Subscription Required"
      if story.summary == "No summary available."
        puts "This is a story requiring a subscription to read, and unfortunately there is no article into to show."
      else
        puts "This is a story requiring a subscription, but here is the intro to the article."
        puts " "
        puts story.summary
      end
    else
      puts story.headline.upcase
      TeamNews::Scraper.scrape_article(story.link)
    end
  end

end
