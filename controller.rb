# send welcome message to view
# View.welcome (welcome message, instructions, let's get started - make full screen - press any key
####### View.options
####### Make a selection of your option - take user input and press enter- compare against model
# if exit is typed, then stop, otherwise continue
# assuming it is not exit, then show first two lines of image (View.lines)
# ask for user input
# if user input == the answer, you win
  # if win, show whole picture
# if user input != the answer, continue guessing  -ask you for user input
  # if you see all picture, but have not yet guessed it, then say nice try.  YOU ARE GREAT AND SPECIAL!!!!KK!K!!!
require_relative 'view'
require_relative 'game'


class Controller

  def initialize
    View.welcome
    run_game
  end

  def get_input
    gets.chomp
  end

  def run_game
    if get_input != "exit"
      play_game
    end
  end

  def play_game
    # get_image_lines
    game = Game.new
    image_piece = game.calc_image_lines
    View.image_piece(output)

  end

end


controller = Controller.new





# class PictureDisplay

#   def initialize(filename)
#     @filename = filename

#     file_open

#   end

#   # def file_open
#   #   File.foreach(@filename) do |line|
#   #     @picture << line
#   #   end
#   # end

#   def show_more
#     while @counter <= @stop
#       puts @picture[@counter]
#       @counter += 1
#     end
#     @counter = @stop + 1
#     @stop += @increment
#   end
# end

# game = Game.new
# panda = PictureDisplay.new('panda.txt')

# puts "Welcome to Guesscii"

# panda.show_more
# game.get_user_input
# game.check_answer
# game.correct

# while game.correct == false
#   panda.show_more
#   game.get_user_input
#   game.check_answer
#   game.correct
#   game.user_input
# end
#   game.show_win



# class Game

#   attr_reader :correct, :user_input, :output

#   def initialize
#     @user_input = ''
#     @picture = []
#     @counter = 0
#     @increment = @picture.length/5
#     @output = []
#     @stop = @increment
#     @answer = 'panda'
#     @correct = false
#   end

#   def calc_image_lines
#     while @counter <= @stop
#       output << @picture[@counter]
#       #output << "\n"
#       @counter += 1
#     end
#     @counter = @stop + 1
#     @stop += @increment
#     output
#   end

#   def check_answer
#     @correct = (@user_input == @answer)
#   end

#   def get_user_input
#     @user_input = gets.chomp
#   end

#   def show_win
#     puts "You WON!!!!!!"
#   end

# end