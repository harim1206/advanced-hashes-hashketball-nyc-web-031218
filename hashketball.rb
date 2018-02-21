# Write your code here!
require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players: {

        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },

        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },

        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },

        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },

        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }

      }

    },

    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players: {

        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },

        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },

        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },

        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        },

        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }
      }# /players

    }# /away



  }# /game_hash
end






def num_points_scored(player_name)

  game_hash.each{
    |location, team_data|
    #binding.pry

    if team_data[:players].keys.include?(player_name)
      puts (team_data[:players][player_name][:points])
      return team_data[:players][player_name][:points]
    end

  }

end

#num_points_scored("Reggie Evans")
#num_points_scored("DeSagna Diop")






def shoe_size(player_name)

  game_hash.each{
    |location, team_data|
    #binding.pry

    if team_data[:players].keys.include?(player_name)
      puts (team_data[:players][player_name][:shoe])
      return team_data[:players][player_name][:shoe]
    end

  }

end

#shoe_size("Reggie Evans")
#shoe_size("Ben Gordon")






def team_colors(team_name)

  game_hash.each{
    |location, team_data|

    if team_data[:team_name] === team_name

      puts (team_data[:colors])
      return team_data[:colors]

    end
  }


end

#team_colors("Brooklyn Nets")






def team_names
  arr = []

  game_hash.each{
    |location, team_data|
    arr << team_data[:team_name]
  }

  puts ("arr: #{arr}")
  return arr

end

#team_names






def player_numbers(team_name)
  # returns an array of jersey numbers for that team_name

  jersey_numbers = []

  game_hash.each{
    |location, team_data|



    if team_data[:team_name] == team_name
      team_data[:players].each{
        |player, stats|
      #  binding.pry

        jersey_numbers << stats[:number]
      }

    end
  }

  puts ("Jersey Numbers: #{jersey_numbers}")
  return jersey_numbers

end

#player_numbers("Charlotte Hornets")






def player_stats(player_name)
  game_hash.each{
    |location, team_data|

    if team_data[:players].keys.include?(player_name)
      puts ("#{player_name}: #{team_data[:players][player_name]} ")
      return team_data[:players][player_name]
    end

  }

end

#player_stats("Alan Anderson")





def big_shoe_rebounds
  biggestShoe = 0
  biggestShoePlayer = ""

  game_hash.each{
    |location, team_data|
    team_data[:players].each{
      |player_name, stats|
      #binding.pry

      if stats[:shoe] > biggestShoe
        biggestShoe = stats[:shoe]
        biggestShoePlayer = player_name

        puts("#{player_name}'s shoe size: #{biggestShoe}'")

      end
    }
  }

  game_hash.each{
    |location, team_data|
    if team_data[:players].keys.include?(biggestShoePlayer)
      puts("Rebounds: #{team_data[:players][biggestShoePlayer][:rebounds]}")
      return team_data[:players][biggestShoePlayer][:rebounds]
    end
  }

end

#big_shoe_rebounds

def long_name_steals_a_ton?
#Write a method that returns true if the player with the longest name had the most steals. Call the method long_name_steals_a_ton?.
#Find the longest name, and most steals

  longest_name = ""
  longest_name_steals = 0

  game_hash.each{
    |location, team_data|
    team_data[:players].each{
      |player_name, stats|
      #binding.pry

      if player_name.length > longest_name.length
        longest_name = player_name
        longest_name_steals = stats[:steals]
        #binding.pry
        puts("#{longest_name}'s name length: #{longest_name.length}, and steals: #{stats[:steals]}")

      end
    }
  }#/game_hash.each

  game_hash.each{
    |location, team_data|
    team_data[:players].each{
      |player_name, stats|
      puts("#{player_name}'s steals: #{stats[:steals]}. #{longest_name}'s steals: #{longest_name_steals}")
      if stats[:steals] > longest_name_steals
        puts false
        return false
      end
    }
  }

  puts(true)
  return true




end

long_name_steals_a_ton?
