class Game

  attr_reader :correct, :user_input

  def initialize
    @user_input = ''
    @answer = 'panda'
    @correct = false
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


class PictureDisplay

  def initialize(filename)
    @filename = filename
    @picture = []
    @counter = 0
    file_open
    @increment = @picture.length/5
    @stop = @increment
  end

  def file_open
    File.foreach(@filename) do |line|
      @picture << line
    end
  end

  def show_more
    while @counter <= @stop
      puts @picture[@counter]
      @counter += 1
    end
    @counter = @stop + 1
    @stop += @increment
  end
end

game = Game.new
panda = PictureDisplay.new('panda.txt')

puts "Welcome to Guesscii"

panda.show_more
game.get_user_input
game.check_answer
game.correct

while game.correct == false
  panda.show_more
  game.get_user_input
  game.check_answer
  game.correct
  game.user_input
end
  game.show_win
