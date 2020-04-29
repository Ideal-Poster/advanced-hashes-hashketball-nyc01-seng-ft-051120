# Write your code below game_hash
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

# helper functions

def find_team_of_player(player)
  game_hash.values.find { |team| 
    team[:players]
      .collect{ |player_stats| player_stats[:player_name] }
      .include?(player)
  }
end

def player_stats(player)
  team = find_team_of_player(player)
  team[:players].find { |player_stats| player_stats.has_value?(player) }
end

def find_team_by_name(team)
  game_hash.values.find { |team_info| team_info.has_value?(team) }
end

def all_players
  all_players = game_hash.values.collect { |team| team[:players] }
  all_players = all_players[0].concat(all_players[1])
end

# main functions

def num_points_scored(player)
  player_stats(player)[:points]
end

def shoe_size(player)
  player_stats(player)[:size]
end

def team_colors(team)
  find_team_by_name(team)[:colors]
end

def team_names 
  game_hash.values.collect { |team| team[:team_name] }
end

def player_numbers(team)
  find_team_by_name(team)[:players].collect { |player| player[:number] }
end

def big_shoe_rebounds
  all_players
    .sort_by { |player_stats| player_stats[:shoe] }
    .last[:rebounds]
end

# Bonus questions

def most_points_scored
  all_players
    .sort_by{ |player_stats| player_stats[:points] }
    .last[:player_name]
end

def winning_team
 game_hash.values
  .collect { |team_stats| 
    { 
      team_name: team_stats[:team_name],
      points: team_stats[:players].reduce(0) { |memo, player_stats| 
        memo +  player_stats[:points]
      }
    }
  }
  .sort_by { |team| team[:points] }
  .last[:team_name]
end

def player_with_longest_name
  all_players
    .sort { |a, b| a[:player_name].length <=> b[:player_name].length }
    .last[:player_name]
end

def long_name_steals_a_ton?
  all_players
    .sort { |a, b| a[:steals] <=> b[:steals] }
    .last[:player_name] == player_with_longest_name
end