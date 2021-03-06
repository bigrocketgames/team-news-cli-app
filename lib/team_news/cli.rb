require 'pry'

class TeamNews::CLI
  attr_accessor :ncaa_conference_choice
  SPORTS = ["NFL", "NCAA"]
  NFL_TEAMS = [["Arizona Cardinals", "https://www.scout.com/nfl/cardinals"], ["Atlanta Falcons", "https://www.scout.com/nfl/falcons"], ["Baltimore Ravens", "https://www.scout.com/nfl/ravens"], ["Buffalo Bills", "https://www.scout.com/nfl/bills"], ["Caronlina Panthers", "https://www.scout.com/nfl/panthers"], ["Chicago Bears", "https://www.scout.com/nfl/bears"], ["Cincinnati Bengals", "https://www.scout.com/nfl/bengals"], ["Cleveland Browns", "https://www.scout.com/nfl/browns"], ["Dallas Cowboys", "https://www.scout.com/nfl/cowboys"], ["Denver Broncos", "https://www.scout.com/nfl/broncos"], ["Detroit Lions", "https://www.scout.com/nfl/lions"], ["Green Bay Packers", "https://www.scout.com/nfl/packers"], ["Houston Texans", "https://www.scout.com/nfl/texans"], ["Indianapolis Colts", "https://www.scout.com/nfl/colts"], ["Jacksonville Jaguars", "https://www.scout.com/nfl/jaguars"], ["Kansas City Chiefs", "https://www.scout.com/nfl/chiefs"], ["Los Angeles Rams", "https://www.scout.com/nfl/rams"], ["Miami Dolphins", "https://www.scout.com/nfl/dolphins"], ["Minnesota Vikings", "https://www.scout.com/nfl/vikings"], ["New England Patriots", "https://www.scout.com/nfl/patriots"], ["New Orleans Saints", "https://www.scout.com/nfl/saints"], ["New York Giants", "https://www.scout.com/nfl/giants"], ["New York Jets", "https://www.scout.com/nfl/jets"], ["Oakland Raiders", "https://www.scout.com/nfl/raiders"], ["Philadelphia Eagles", "https://www.scout.com/nfl/eagles"], ["Pittsburgh Steelers", "https://www.scout.com/nfl/steelers"], ["Sand Diego Chargers", "https://www.scout.com/nfl/chargers"], ["San Francisco 49ers", "https://www.scout.com/nfl/49ers"], ["Seattle Seahawks", "https://www.scout.com/nfl/seahawks"], ["Tampa Bay Buccaneers", "https://www.scout.com/nfl/buccaneers"], ["Tennessee Titans", "https://www.scout.com/nfl/titans"], ["Washington Redskins", "https://www.scout.com/nfl/redskins"]]
  NCAA_CONFERENCES = ["SEC", "ACC", "BIG 10", "BIG 12", "AMERICAN", "PAC 12", "CONFERENCE USA", "MOUNTAIN WEST", "MAC", "SUN BELT", "INDEPENDENTS"]
  SEC_TEAMS = [["Alabama Crimson Tide", "https://www.scout.com/college/alabama"], ["Arkansas Razorbacks", "https://www.scout.com/college/arkansas"], ["Auburn Tigers", "https://www.scout.com/college/auburn"], ["Florida Gators", "https://www.scout.com/college/florida"], ["Georgia Bulldogs", "https://www.scout.com/college/georgia"], ["Kentucky Wildcats", "https://www.scout.com/college/kentucky"], ["LSU Tigers", "https://www.scout.com/college/lsu"], ["Mississippi Rebels", "https://www.scout.com/college/ole-miss"], ["Mississippi State Bulldogs", "https://www.scout.com/college/mississippi-state"], ["Missouri Tigers", "https://www.scout.com/college/missouri"], ["South Carolina Gamecocks", "https://www.scout.com/college/south-carolina"], ["Tennessee Volunteers", "https://www.scout.com/college/tennessee"], ["Texas A&M Aggies", "https://www.scout.com/college/texas-am"], ["Vanderbilt Commodores", "https://www.scout.com/college/vanderbilt"]]
  ACC_TEAMS = [["Boston College Eagles", "https://www.scout.com/college/boston-college"], ["Clemson Tigers", "https://www.scout.com/college/clemson"], ["Duke Blue Devils", "https://www.scout.com/college/duke"], ["Florida State Seminoles", "https://www.scout.com/college/florida-state"], ["Georgia Tech Yellow Jackets", "https://www.scout.com/college/georgia-tech"], ["Louisville Cardinals", "https://www.scout.com/college/louisville"], ["Miami(FL) Hurricanes", "https://www.scout.com/college/miami"], ["NC State Wolfpack", "https://www.scout.com/college/north-carolina-state"], ["North Carolina Tar Heels", "https://www.scout.com/college/north-carolina"], ["Pittsburgh Panthers", "https://www.scout.com/college/pittsburgh"], ["Syracuse Orangemen", "https://www.scout.com/college/syracuse"], ["Virgina Cavaliers", "https://www.scout.com/college/virginia"], ["Virginia Tech Hokies", "https://www.scout.com/college/virginia-tech"], ["Wake Forest Demon Deacons", "https://www.scout.com/college/wake-forest"]]
  BIG_10_TEAMS = [["Illinois Fighting Illini", "https://www.scout.com/college/illinois"], ["Indiana Hoosiers", "https://www.scout.com/college/indiana"], ["Iowa Hawkeyes", "https://www.scout.com/college/iowa"], ["Maryland Terrapins", "https://www.scout.com/college/maryland"], ["Michigan State Spartans", "https://www.scout.com/college/michigan-state"], ["Michigan Wolverines", "https://www.scout.com/college/michigan"], ["Minnesota Golden Gophers", "https://www.scout.com/college/minnesota"], ["Nebraska Cornhuskers", "https://www.scout.com/college/nebraska"], ["Northwestern Wildcats", "https://www.scout.com/college/northwestern"], ["Ohio State Buckeyes", "https://www.scout.com/college/ohio-state"], ["Penn State Nittany Lions", "https://www.scout.com/college/penn-state"], ["Purdue Boilermakers", "https://www.scout.com/college/purdue"], ["Rutgers Scarlet Knights", "https://www.scout.com/college/rutgers"], ["Wisconsin Badgers", "https://www.scout.com/college/wisconsin"]]
  BIG_12_TEAMS = [["Baylor Bears", "https://www.scout.com/college/baylor"], ["Iowa State Cyclones", "https://www.scout.com/college/iowa-state"], ["Kansas Jayhawks", "https://www.scout.com/college/kansas"], ["Kansas State Wildcats", "https://www.scout.com/college/kansas-state"], ["Oklahoma Sooners", "https://www.scout.com/college/oklahoma"], ["Oklahoma State Cowboys", "https://www.scout.com/college/oklahoma-state"], ["TCU Horned Frogs", "https://www.scout.com/college/tcu"], ["Texas Longhorns", "https://www.scout.com/college/texas"], ["Texas Tech Red Raiders", "https://www.scout.com/college/texas-tech"], ["West Virginia Mountaineers", "https://www.scout.com/college/west-virginia"]]
  AAC_TEAMS = [["Cincinnati Bearcats", "https://www.scout.com/college/cincinnati"], ["Connecticut Huskies", "https://www.scout.com/college/uconn"], ["East Carolina Panthers", "https://www.scout.com/college/east-carolina"], ["Houston Cougars", "https://www.scout.com/college/houston"], ["Memphis Tigers", "https://www.scout.com/college/memphis"], ["Navy Midshipmen", "https://www.scout.com/college/navy"], ["SMU Mustangs", "https://www.scout.com/college/southern-methodist"], ["South Florida Bulls", "https://www.scout.com/college/south-florida"], ["Temple Owls", "https://www.scout.com/college/temple"], ["Tulane Green Wave", "https://www.scout.com/college/tulane"], ["Tulsa Golden Hurricane", "https://www.scout.com/college/tulsa"], ["UCF Golden Knights", "https://www.scout.com/college/central-florida"]]
  PAC_12_TEAMS = [["Arizona State Sun Devils", "https://www.scout.com/college/arizona-state"], ["Arizona Wildcats", "https://www.scout.com/college/arizona"], ["California Golden Bears", "https://www.scout.com/college/california"], ["Colorado Buffaloes", "https://www.scout.com/college/colorado"], ["Oregon Ducks", "https://www.scout.com/college/oregon"], ["Oregon State Beavers", "https://www.scout.com/college/oregon-state"], ["Stanford Cardinal", "https://www.scout.com/college/stanford"], ["UCLA Bruins", "https://www.scout.com/college/ucla"], ["USC Trojans", "https://www.scout.com/college/usc"], ["Utah Utes", "https://www.scout.com/college/utah"], ["Washington Huskies", "https://www.scout.com/college/washington"], ["Washington State Cougars", "https://www.scout.com/college/washington-state"]]
  CUSA_TEAMS = [["Charlotte 49ers", "https://www.scout.com/college/charlotte"], ["Florida Atlantic Owls", "https://www.scout.com/college/florida-atlantic"], ["Florida International Golden Panthers", "https://www.scout.com/college/florida-international"], ["Louisiana Tech Bulldogs", "https://www.scout.com/college/louisiana-tech"], ["Marshall Thundering Herd", "https://www.scout.com/college/marshall"], ["Middle Tennessee State Blue Raiders", "https://www.scout.com/college/middle-tennessee-state"], ["North Texas Eagles", "https://www.scout.com/college/north-texas"], ["Old Dominion Monarchs", "https://www.scout.com/college/old-dominion"], ["Rice Owls", "https://www.scout.com/college/rice"], ["Southern Mississippi", "https://www.scout.com/college/southern-mississippi"], ["Texas-San Antonio Roadrunners", "https://www.scout.com/college/texas-san-antonio"], ["UAB Blazers", "https://www.scout.com/college/alabama-birmingham"], ["UTEP Miners", "https://www.scout.com/college/utep"], ["Western Kentucky Hilltoppers", "https://www.scout.com/college/western-kentucky"]]
  MWC_TEAMS = [["Air Force Falcons", "https://www.scout.com/college/air-force"], ["Boise State Broncos", "https://www.scout.com/college/boise-state"], ["Colorado State Rams", "https://www.scout.com/college/colorado-state"], ["Fresno State Bulldogs", "https://www.scout.com/college/fresno-state"], ["Hawaii Warriors", "https://www.scout.com/college/hawaii"], ["Nevada Wolf Pack", "https://www.scout.com/college/nevada"], ["New Mexico Lobos", "https://www.scout.com/college/new-mexico"], ["San Diego State Aztecs", "https://www.scout.com/college/san-diego-state"], ["San Jose State Spartans", "https://www.scout.com/college/san-jose-state"], ["UNLV Rebels", "https://www.scout.com/college/unlv"], ["Utah State Aggies", "https://www.scout.com/college/utah-state"], ["Wyoming Cowboys", "https://www.scout.com/college/wyoming"]]
  MAC_TEAMS = [["Akron Zips", "https://www.scout.com/college/akron"], ["Ball State Cardinals", "https://www.scout.com/college/ball-state"], ["Bowling Green Falcons", "https://www.scout.com/college/bowling-green"], ["Buffalo Bulls", "https://www.scout.com/college/buffalo"], ["Central Michigan Chippewas", "https://www.scout.com/college/central-michigan"], ["Eastern Michigan Eagles", "https://www.scout.com/college/eastern-michigan"], ["Kent State Golden Flashes", "https://www.scout.com/college/kent-state"], ["Massachusetts Minutement", "https://www.scout.com/college/massachusetts"], ["Miami (OH) RedHawks", "https://www.scout.com/college/miamiohio"], ["Northern Illinois Huskies", "https://www.scout.com/college/northern-illinois"], ["Ohio Bobcats", "https://www.scout.com/college/ohio"], ["Toledo Rockets", "https://www.scout.com/college/toledo"], ["Western Michigan Broncos", "https://www.scout.com/college/western-michigan"]]
  SUN_BELT_TEAMS = [["Appalachian State Mountaineers", "https://www.scout.com/college/appalachian-state"], ["Arkansas State Red Wolves", "https://www.scout.com/college/arkansas-state"], ["Georgia Southern Eagles", "https://www.scout.com/college/georgia-southern"], ["Georgia State Panthers", "https://www.scout.com/college/georgia-state"], ["Idaho Vandals", "https://www.scout.com/college/idaho"], ["Louisiana-Lafayette Ragin Cajuns", "https://www.scout.com/college/louisiana"], ["Louisiana-Monroe Indians", "https://www.scout.com/college/louisiana-monroe"], ["New Mexico State Aggies", "https://www.scout.com/college/new-mexico-state"], ["South Alabama Jaguars", "https://www.scout.com/college/south-alabama"], ["Texas State Bobcats", "https://www.scout.com/college/texas-state"], ["Troy Trojans", "https://www.scout.com/college/troy"]]
  INDEPENDENT_TEAMS = [["Army West Point Black Knights", "https://www.scout.com/college/army"], ["BYU Cougars", "https://www.scout.com/college/byu"], ["Notre Dame Fighting Irish", "https://www.scout.com/college/notre-dame"]]

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

    while choice != "exit" && choice != "1" && choice != "2"
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
        list_ncaa_conferences
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

    while choice != "0" && choice != "exit" && !choice.to_i.between?(1,NFL_TEAMS.count)
      puts " "
      puts "Please enter the number of the team you would like to see headlines for."
      puts "Enter 0 to go back to the main menu or 'exit' to end your session."
      choice = gets.strip.downcase
      if choice == "0"
        puts " "
        call
      elsif choice == "exit"
        puts "Goodbye"
      elsif choice.to_i.between?(1,NFL_TEAMS.count)
        puts " "
        TeamNews::Story.reset
        while TeamNews::Story.all.count < 20
          TeamNews::Story.reset
          TeamNews::Story.story_scrape(NFL_TEAMS[choice.to_i-1][1])
        end
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

  def list_ncaa_conferences
    count = 1
    NCAA_CONFERENCES.each do |c|
      puts "#{count}. #{c}"
      count += 1
    end
    choice = nil

    while choice != "0" && choice != "exit" && !choice.to_i.between?(1,11)
      puts " "
      puts "Please enter the number of the conference you would like to see the team for."
      puts "Enter 0 to go back to the main menu or 'exit' to end your session."
      choice = gets.strip.downcase
      if choice == "0"
        puts " "
        call
      elsif choice == "exit"
        puts "Goodbye"
      elsif choice.to_i.between?(1,NCAA_CONFERENCES.count)
        puts " "
        case choice.to_i
        when 1
          list_ncaa_teams(SEC_TEAMS)
        when 2
          list_ncaa_teams(ACC_TEAMS)
        when 3
          list_ncaa_teams(BIG_10_TEAMS)
        when 4
          list_ncaa_teams(BIG_12_TEAMS)
        when 5
          list_ncaa_teams(AAC_TEAMS)
        when 6
          list_ncaa_teams(PAC_12_TEAMS)
        when 7
          list_ncaa_teams(CUSA_TEAMS)
        when 8
          list_ncaa_teams(MWC_TEAMS)
        when 9
          list_ncaa_teams(MAC_TEAMS)
        when 10
          list_ncaa_teams(SUN_BELT_TEAMS)
        when 11
          list_ncaa_teams(INDEPENDENT_TEAMS)
        end
      end
    end
  end

  def list_ncaa_teams(conference)
    @ncaa_conference_choice = conference
    count = 1
    conference.each do |t|
      puts "#{count}. #{t[0]}"
      count += 1
    end

    choice = nil

    while choice != "0" && choice != "exit" && !choice.to_i.between?(1,conference.count)
      puts " "
      puts "Please enter the number of the team you would like to see headlines for."
      puts "Enter 0 to go back to the conference menu or 'exit' to end your session."
      choice = gets.strip.downcase
      if choice == "0"
        puts " "
        list_ncaa_conferences
      elsif choice == "exit"
        puts "Goodbye"
      elsif choice.to_i.between?(1,conference.count)
        puts " "
        TeamNews::Story.reset
        while TeamNews::Story.all.count < 20
          TeamNews::Story.reset
          TeamNews::Story.story_scrape(conference[choice.to_i-1][1])
        end
          list_ncaa_team_stories
      end
    end
  end

  def list_ncaa_team_stories
    TeamNews::Story.story_list
    choice = nil

    # turn this to a loop to make sure only proper answers are entered
    while choice != "0" && choice != "exit" && !choice.to_i.between?(1,20)
      puts " "
      puts "Please enter the number of the story you would like to read."
      puts "Enter 0 to return to the list of teams or 'exit' to end your session."
      choice = gets.strip.downcase
      if choice == "0"
        puts " "
        list_ncaa_teams(@ncaa_conference_choice)
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
          puts "Enter 0 to return to the list of teams or 'exit' to end your session."
          choice_2 = gets.strip.downcase
          if choice_2 == "0"
            puts " "
            list_ncaa_teams(@ncaa_conference_choice)
          elsif choice_2 == "list"
            puts " "
            list_ncaa_team_stories
          elsif choice_2 == "exit"
            puts "Goodbye"
          end
        end
      end
    end
  end

end
