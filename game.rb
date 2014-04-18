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

module View
  def self.get_user_input
    @user_input = gets.chomp
  end
end

class PictureDisplay

  def initialize(picture)
    @picture = picture
    @counter = 0
    @increment = @picture.length/5
    @stop = @increment
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


panda = PictureManager.new('panda.txt')
bird = PictureManager.new('bird.txt')

game = Game.new(bird.answer)
show = PictureDisplay.new(bird.picture)

# puts "Welcome to Guesscii"

# show.show_more
# View.get_user_input
# game.check_answer
# game.correct

# while game.correct == false
#   show.show_more
#   View.get_user_input
#   game.check_answer
#   game.correct
#   game.user_input
# end
#   game.show_win
