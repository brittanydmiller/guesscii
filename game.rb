require_relative 'picture_manager'

class Game

  attr_reader :answer


  def initialize(answer)
    @answer = answer
  end

  def check_answer(guess)
    guess == @answer
  end

end
