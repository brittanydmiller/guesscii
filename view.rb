##Future: Clear screen, move to home
require 'curses'

class View

  def self.welcome
    setup_screen
    puts "Welcome to Guesscii\n".center(100)
    puts
    puts "Press 1 to play game".center(100)
    puts "Press 2 for instructions".center(100)
    puts "Pres 3 for game info".center(100)
  end

  def self.instructions
    setup_screen
    puts "Geusscii will show you lines of an ASCII based picture".center(100)
    puts "Try to guess what the pictures is!".center(100)
    puts "If you don't guess the correct answer, more of the picture will be revealed.".center(100)
  end

  def self.game_info
    setup_screen
    puts "Guescii.\n".center(100)
    puts "Created by:\n".center(100)
    puts "".ljust(40)+"Andrew Fruth".ljust(70)
    puts "".ljust(40)+"Mia Garbagnati".ljust(70)
    puts "".ljust(40)+"Brittany Miller".ljust(70)
    puts "".ljust(40)+"David Schaaf".ljust(70)

  end

  def self.setup_screen
    clear_screen!
    move_to_home!
    puts
    puts
  end


  def self.image_piece(parser, guess_count, max_guesses)
    setup_screen

    increment = parser.lines / max_guesses

    parser.picture.each_with_index do |line, index|
      print ''.ljust(20)+line if index <= increment*guess_count
    end
  end

  def self.show_full_image(parser, max_guesses)
    setup_screen
    image_piece(parser, max_guesses+1, max_guesses)
  end

  def self.get_input
    gets.chomp
  end

  def self.win(parser, max_guesses)
    show_full_image(parser, max_guesses)
    puts
    puts "You WON!!!!!!".center(100)
  end

  def self.lose(parser, max_guesses, answer)
    show_full_image(parser, max_guesses)
    puts
    puts "Sorry. The answer was '#{answer}.'".center(100)
  end

  # Clear the screen
  def self.clear_screen!
    print "\e[2J"
  end

  # Moves cursor to the top left of the terminal
  def self.move_to_home!
    print "\e[H"
  end

end


