require_relative 'picture_manager'

class Game

  attr_reader :answer, :score

  def initialize(answer)
    @answer = answer
    @score = 10
  end

  def check_answer(guess)
    guess == @answer
  end

  def reduce_score
    @score -= 2
  end

end
