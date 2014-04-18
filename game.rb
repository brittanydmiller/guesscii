require_relative 'picture_manager'

class Game

  attr_reader :correct, :user_input, :output


  def initialize(answer)
    @answer = answer
    @correct = false
  end

  def calc_image_lines
    while @counter <= @stop
      output << @picture[@counter]
      #output << "\n"
      @counter += 1
    end
    @counter = @stop + 1
    @stop += @increment
    output
  end

  def check_answer
    @correct = (@user_input == @answer)
  end

end
