# Write your code below game_hash
require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(player_name)
  game_hash.each do |h_or_a, parent_hash|
        parent_hash[:players].each do |player_hash|     #works because you can access the key AND you already know you only want to access :players
          
          if player_name == player_hash[:player_name]
            return player_hash[:points]
          end
        end
      end
end

def shoe_size(player_name)
  game_hash.each do |h_or_a, parent_hash|
    parent_hash.each do |team_info, data|
      if team_info == :players
        data.each do |categories|
          if player_name == categories[:player_name]
            return categories[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |h_or_a, parent_hash|
    parent_hash.each do |team_info, data|
      if team_name == game_hash[h_or_a][:team_name]
        return game_hash[h_or_a][:colors]
      end
    end
  end
end

def team_names
  teams = []
  game_hash.collect do |h_or_a, parent_hash|
    parent_hash.collect do |team_info, data|
      teams << game_hash[h_or_a][:team_name]
    end
  end
  teams.uniq!
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |h_or_a, parent_hash|
    parent_hash.each do |team_info, data|
      if team_info == :players
        data.each do |categories|
          if team_name == game_hash[h_or_a][:team_name]
            jersey_numbers << categories[:number]
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |h_or_a, parent_hash|
    parent_hash.each do |team_info, data|
      if team_info == :players
        data.each do |categories|
          if player_name == categories[:player_name]
            stats = categories
          end
        end
      end
      #binding.pry
    end
  end
  stats
end

def big_shoe_rebounds#(player_name)
  biggest_shoe = 0
  stats = {}
  game_hash.each do |h_or_a, parent_hash|
    parent_hash.each do |team_info, data|
      if team_info == :players
        data.each do |categories|
          if categories[:shoe] > biggest_shoe
            biggest_shoe = categories[:shoe]
            stats = categories    #since you set stats = categories here you no longer need the code below in which you basically did the exact same thing!
          end
        end
      end
    end
  end
  #biggest_shoe
  # game_hash.each do |h_or_a, parent_hash|
  #   parent_hash.each do |team_info, data|
  #     if team_info == :players
  #       data.each do |categories|
  #         if biggest_shoe == categories[:shoe]
  #         stats = categories
  #         end
  #       end
  #     end
  #   end
  # end
  #binding.pry
  stats[:rebounds]
end

#BONUS

def most_points_scored
  points_scored = 0
  stats = {}
  game_hash.each do |h_or_a, parent_hash|
    parent_hash.each do|team_info, data|
      parent_hash[:players].each do |categories|
        if categories[:points] > points_scored
          points_scored = categories[:points]
          stats = categories    
          #binding.pry
        end
      end
    end
  end
  stats[:player_name]
end

def winning_team
  home_points = []
  away_points = []
  game_hash.each do |h_or_a, parent_hash|
    if h_or_a == :home
      parent_hash[:players].each do |categories|
        home_points << categories[:points]
      end
    end
    if h_or_a == :away
      parent_hash[:players].each do |categories|
        away_points << categories[:points]
      end
    end
  end
  home_points = home_points.sum
  away_points = away_points.sum
  if home_points > away_points
    return game_hash[:home][:team_name]
  else game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |h_or_a, parent_hash|
    parent_hash[:players].each do |categories|
      if categories[:player_name] > longest_name
        longest_name = categories[:player_name]
        binding.pry
      end
    end
  end
  longest_name
end

player_with_longest_name