require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    letters = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
    @new_game = []
    10.times do
      @new_game << letters.sample
    end
  end

  def score
    @result = ''
    @letters = params[:letters]
    @word = params[:word].upcase
    @include = @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }
    @english = english?(params[:word])
  end

  private

  def english?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
