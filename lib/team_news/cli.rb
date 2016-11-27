require 'pry'

class TeamNews::CLI
  SPORTS = ["NFL", "NCAA"]
  NFL_TEAMS = [["Arizona Cardinals", "https://www.scout.com/nfl/cardinals"], ["Atlanta Falcons", "https://www.scout.com/nfl/falcons"], ["Baltimore Ravens", "https://www.scout.com/nfl/ravens"], ["Buffalo Bills", "https://www.scout.com/nfl/bills"], ["Caronlina Panthers", "https://www.scout.com/nfl/panthers"], ["Chicago Bears", "https://www.scout.com/nfl/bears"], ["Cincinnati Bengals", "https://www.scout.com/nfl/bengals"], ["Cleveland Browns", "https://www.scout.com/nfl/browns"], ["Dallas Cowboys", "https://www.scout.com/nfl/cowboys"], ["Denver Broncos", "https://www.scout.com/nfl/broncos"], ["Detroit Lions", "https://www.scout.com/nfl/lions"], ["Green Bay Packers", "https://www.scout.com/nfl/packers"], ["Houston Texans", "https://www.scout.com/nfl/texans"], ["Indianapolis Colts", "https://www.scout.com/nfl/colts"], ["Jacksonville Jaguars", "https://www.scout.com/nfl/jaguars"], ["Kansas City Chiefs", "https://www.scout.com/nfl/chiefs"], ["Los Angeles Rams", "https://www.scout.com/nfl/rams"], ["Miami Dolphins", "https://www.scout.com/nfl/dolphins"], ["Minnesota Vikings", "https://www.scout.com/nfl/vikings"], ["New England Patriots", "https://www.scout.com/nfl/patriots"], ["New Orleans Saints", "https://www.scout.com/nfl/saints"], ["New York Giants", "https://www.scout.com/nfl/giants"], ["New York Jets", "https://www.scout.com/nfl/jets"], ["Oakland Raiders", "https://www.scout.com/nfl/raiders"], ["Philadelphia Eagles", "https://www.scout.com/nfl/eagles"], ["Pittsburgh Steelers", "https://www.scout.com/nfl/steelers"], ["Sand Diego Chargers", "https://www.scout.com/nfl/chargers"], ["San Francisco 49ers", "https://www.scout.com/nfl/49ers"], ["Seattle Seahawks", "https://www.scout.com/nfl/seahawks"], ["Tampa Bay Buccaneers", "https://www.scout.com/nfl/buccaneers"], ["Tennessee Titans", "https://www.scout.com/nfl/titans"], ["Washington Redskins", "https://www.scout.com/nfl/redskins"]]

  def call
    puts "Welcome to Team News"
    puts " "
    list_sports
  end

  def list_sports
    count = 1

    SPORTS.each do |s|
      puts "#{count}. #{s}"
      count += 1
    end

    choice = nil

    while choice != "exit" && choice != "1"
      puts " "
      puts "Please enter the number of the sport you would like to see."
      puts "Enter 'exit' to end your session."
      puts " "
      choice = gets.strip.downcase
      if choice == "1"
        puts " "
        list_nfl_teams
      elsif choice == "2"
        puts " "
        list_ncaa_teams
      elsif choice == "exit"
        puts "Goodbye"
      end
    end

  end

  def list_nfl_teams
    count = 1
    NFL_TEAMS.each do |t|
      puts "#{count}. #{t[0]}"
      count += 1
    end

    choice = nil

    # turn this to a loop to make sure only proper answers are entered
    while choice != "0" && choice != "exit" && !choice.to_i.between?(1,32)
      puts " "
      puts "Please enter the number of the team you would like to see headlines for."
      puts "Enter 0 to go back to the main menu or 'exit' to end your session."
      choice = gets.strip.downcase
      if choice == "0"
        puts " "
        call
      elsif choice == "exit"
        puts "Goodbye"
      elsif choice.to_i.between?(1,32)
        puts " "
        TeamNews::Story.reset
        html = TeamNews::Story.story_scrape(NFL_TEAMS[choice.to_i-1][1])
        list_nfl_team_stories
      end
    end
  end

  def list_nfl_team_stories
    TeamNews::Story.story_list

    choice = nil

    # turn this to a loop to make sure only proper answers are entered
    while choice != "0" && choice != "exit" && !choice.to_i.between?(1,20)
      puts " "
      puts "Please enter the number of the story you would like to read."
      puts "Enter 0 to return to the list of NFL teams or 'exit' to end your session."
      choice = gets.strip.downcase
      if choice == "0"
        puts " "
        list_nfl_teams
      elsif choice == "exit"
        puts "Goodbye"
      elsif choice.to_i.between?(1,20)
        puts " "
        TeamNews::Story.read_story(choice.to_i-1)
        choice_2 = nil
        # add a loop to ask to list stories, return to previous menu, or exit.
        while choice_2 != "exit" && choice_2 != "list" && choice_2 != "0"
          puts " "
          puts "Please enter 'list' to see the list of articles again."
          puts "Enter 0 to return to the list of NFL teams or 'exit' to end your session."
          choice_2 = gets.strip.downcase
          if choice_2 == "0"
            puts " "
            list_nfl_teams
          elsif choice_2 == "list"
            puts " "
            list_nfl_team_stories
          elsif choice_2 == "exit"
            puts "Goodbye"
          end
        end
      end
    end
  end

end
