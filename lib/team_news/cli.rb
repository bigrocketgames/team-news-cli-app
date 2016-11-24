require 'pry'

class TeamNews::CLI
  SPORTS = ["NFL", "NCAA"]
  NFL_TEAMS = [["Arizona Cardinals", "https://www.scout.com/nfl/cardinals"], ["Atlanta Falcons", "https://www.scout.com/nfl/falcons"], "Baltimore Ravens", "Buffalo Bills", "Caronlina Panthers", "Chicago Bears", "Cincinnati Bengals", "Cleveland Browns", "Dallas Cowboys", "Denver Broncos", "Detroit Lions", "Green Bay Packers", "Houston Texans", "Indianapolis Colts", "Jacksonville Jaguars", "Kansas City Chiefs", "Los Angeles Rams", "Miami Dolphins", "Minnesota Vikings", "New England Patriots", "New Orleans Saints", "New York Giants", "New York Jets", "Oakland Raiders", "Philadelphia Eagles", "Pittsburgh Steelers", "Sand Diego Chargers", "San Francisco 49ers", "Seattle Seahawks", "Tampa Bay Buccaneers", "Tennessee Titans", "Washington Redskins"]

  def call
    puts "Welcome to Team News"
    list_sports
  end

  def list_sports

    puts "Please enter the number of the sport you would like to see."
    count = 1

    SPORTS.each do |s|
      puts "#{count}. #{s}"
      count += 1
    end

    choice = gets.strip.downcase

    if choice == "1"
      list_nfl_teams
    end

  end

  def list_nfl_teams
    puts "Please enter the number of the team you would like to see headlines for."
    puts "Or enter 0 to go back to the main menu."
    count = 1

    NFL_TEAMS.each do |t|
      puts "#{count}. #{t[0]}"
      count += 1
    end

    choice = gets.strip.downcase

    if choice == "0"
      call
    else
      # test that scraper is working by pushing the website from the NFL team array to TeamNews::Scraper.nfl_team_scrape()
      html = TeamNews::Story.new.class.story_list(NFL_TEAMS[choice.to_i-1][1])

    end

  end

end