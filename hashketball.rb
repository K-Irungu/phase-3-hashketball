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


def num_points_scored(player_name)
  home_players_names = game_hash[:home][:players].map{ |player| player[:player_name] }
  home_players_names.include?(player_name) ?  game_hash[:home][:players].find { |player| player[:player_name] == player_name }[:points] : game_hash[:away][:players].find { |player| player[:player_name] == player_name }[:points]
end

def shoe_size (player_name)
  home_players_names = game_hash[:home][:players].map{ |player| player[:player_name] }
  home_players_names.include?(player_name) ?  game_hash[:home][:players].find { |player| player[:player_name] == player_name }[:shoe] : game_hash[:away][:players].find { |player| player[:player_name] == player_name }[:shoe]
end

def team_colors (team_name)
  if team_name == "Charlotte Hornets"
    game_hash[:away][:colors]
  elsif team_name == "Brooklyn Nets"
    game_hash[:home][:colors]
  end
end

def team_names
  game_hash.keys.map { |team| game_hash[team][:team_name] }
end

def player_numbers (team_name)
  if team_name == "Charlotte Hornets"
    game_hash[:away][:players].map { |player| player[:number]}
  elsif team_name == "Brooklyn Nets"
    game_hash[:home][:players].map { |player| player[:number]}
  end
end

def player_stats (player_name)
  home_players_names = game_hash[:home][:players].map{ |player| player[:player_name] }
  home_players_names.include?(player_name) ?  game_hash[:home][:players].find { |player| player[:player_name] == player_name } : game_hash[:away][:players].find { |player| player[:player_name] == player_name }
end

def big_shoe_rebounds
  all_players = game_hash.keys.map { |key| game_hash[key][:players] }.flatten
  all_shoe_sizes = all_players.map { |player| player[:shoe] }  
  biggest_shoe = all_shoe_sizes.max
  all_players.find { |player| player[:shoe] == biggest_shoe}[:rebounds]
end

def most_points_scored 
  all_players = game_hash.keys.map { |key| game_hash[key][:players] }.flatten
  all_scores = all_players.map { |player| player[:points] }  
  all_scores.max
end

def winning_team
  home_points = game_hash[:home][:players].map{ |player| player[:points] }.sum
  away_points = game_hash[:away][:players].map{ |player| player[:points] }.sum
  winner = (home_points > away_points) ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
  all_players = game_hash.keys.map { |key| game_hash[key][:players] }.flatten
  longest_name_length = all_players.map { |player| player[:player_name].length}.max
  longest_name = all_players.filter { |player|  player[:player_name].length == longest_name_length}
  longest_name[0][:player_name]
end

def long_name_steals_a_ton
  long_name = player_with_longest_name()
  long_name_steals = player_stats(long_name)[:steals]

  all_players = game_hash.keys.map { |key| game_hash[key][:players] }.flatten
  most_steals = all_players.map { |player| player[:steals] }.max

  (long_name_steals == most_steals) ? true : false

end






