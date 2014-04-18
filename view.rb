##Future: Clear screen, move to home

class View

  def self.welcome
    clear_screen!
    move_to_home!
    puts "Welcome to Guesscii\nPress 'Enter' to continue"
  end

  def self.image_piece(parser, guess_count, max_guesses)
    clear_screen!
    move_to_home!

    line_number = 0
    increment = parser.lines / max_guesses

    parser.picture.each_with_index do |line, index|
      puts line if index <= increment*guess_count
    end

  end

  def self.get_input
    gets.chomp
  end

  def self.win
    puts "You WON!!!!!!"
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


