class Game

  attr_reader :correct, :user_input, :output

  def initialize
    @user_input = ''
    @picture = []
    @counter = 0
    @increment = @picture.length/5
    @output = []
    @stop = @increment
    @answer = 'panda'
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

  def get_user_input
    @user_input = gets.chomp
  end

  def show_win
    puts "You WON!!!!!!"
  end

end


