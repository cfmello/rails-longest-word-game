class GamesController < ApplicationController
  def new
    letters = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
    @new_game = []
    10.times do
      @new_game << letters.sample
    end
  end

  def score; end
end
