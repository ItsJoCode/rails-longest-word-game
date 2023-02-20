require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = grid
  end

  def score
    if invalid_word?
      @words = "Sorry but #{params[:word]} can't be built out of #{params[:letters]}"
    elsif parse?
      @words = "Congratulations, #{params[:word]} is a valid English word"
    else
      @words = "Sorry but #{params[:word]} does not seem to be a valid English word"
    end
  end

  private

  def grid
    tab = []
    10.times do
      letter = ('A'..'Z').to_a.sample
      tab << letter
    end
    tab.join('')
  end

  def parse?
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    user_serialized = URI.open(url).read
    parse = JSON.parse(user_serialized)
    parse['found']
  end

  def invalid_word?
    params[:letters].split(' ').each do |letter|
      if !params[:words].split('').include?(letter)
        return true
      else
        return false
      end
    end
  end
end
