require_relative 'picture_manager'

class Game

  attr_reader :correct, :user_input

  def initialize(answer)
    @answer = answer
    @correct = false
  end

  def check_answer
    @correct = (@user_input == @answer)
  end

end
