class GamesController < ApplicationController
  include GamesHelper

  def game
    @grid = generate_grid(10)
  end

  def score
    @end = Time.now
    @word = params[:word]
    @start = DateTime.parse(params[:start])
    @grid = params[:grid].split("")
    @result = run_game(@word, @grid, @start, @end)
  end
end
