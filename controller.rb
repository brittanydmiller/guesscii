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
require_relative 'db/config'
require_relative 'db/picture_importer'
require_relative 'view'
require_relative 'game'


class Controller
  attr_reader :max_guesses, :game

  def initialize
    @guess_count = 1
    @max_guesses = 5
    View.welcome
    run_game
    # @total_score = 0
  end

  def run_game
    if View.get_input != "exit"
      setup_game(1)
      play_game
    end
  end

  def setup_game(index)
    @picture = Picture.find(index)
    @game = Game.new(@picture.answer)
    @parser = PictureManager.new(@picture.location)
  end

  def play_game
    View.image_piece(@parser, @guess_count, @max_guesses)
    guess = get_user_guess
    if check_user_response(guess)
      View.win
      # View.score
      # @total_score += @game.score
      puts "Your score for this round is: #{@game.score}" # figure out how to get this in view
      # puts "Your total score is: #{@total_score}"
      # View Score
    else
      @game.reduce_score
      #Reduce Score  if guess_count == 6 View.Score
      if @game.score == 0
        puts "Your score for this round is: #{@game.score}"
      else
        play_game
      end
      # play_game unless @game.score == 0
      # puts "Your score for this round is: #{@game.score}" #@guess_count > @max_guesses + 1
    end
  end

  def picture_complete?(line)
    @picture.lines <= line
  end

  def get_user_guess
    @guess_count += 1
    View.get_input
  end

  def check_user_response(guess)
    @game.check_answer(guess)
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
#       puts @picture[@counter]
#     while @counter <= @stop
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



# end