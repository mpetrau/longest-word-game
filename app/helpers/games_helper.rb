module GamesHelper
  def hell
    "hello"
  end
end

require 'open-uri'
require 'json'

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  a = []
  grid_size.times{ a << (65 + rand(25)).chr }
  a
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result
  url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
  duration = (end_time - start_time).to_i
  h = { time: duration, score: 0, message: "Lost! Not in the grid" }
  attempt = attempt.upcase.split("")
  if attempt & grid == attempt
    d = JSON.parse(open(url).read)
    if d["found"]
      h[:score] = d["length"].to_i * 20 - duration * 3
      h[:message] = "Got it! Well done!"
    else
      h[:message] = "Lost! Not an english word!"
    end
  end
  h
end

