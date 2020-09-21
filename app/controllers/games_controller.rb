require 'rest-client'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = []
    10.times do
      index = rand(0..25)
      random_letter = ('A'..'Z').to_a[index]
      @letters << random_letter
    end
  end

  def score
    @valid = valid?
    if valid? && exists?
      time_start = params[:time].to_i.to_f
      time_end = Time.now.to_i.to_f
      @score = (params[:answer].length * (100000 / (time_end - time_start))).round
    else
      @score = 0
    end

  end

  def valid?
    params[:answer].split("").each do |e|
      unless params[:letters].include?(e.upcase)
        return false
      end
    end
    return true
  end

  def exists?
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    response = RestClient.get(url)
    answer = JSON.parse(response)
    return answer["found"]
  end

end
