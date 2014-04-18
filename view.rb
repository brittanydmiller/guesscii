
class View

  def self.welcome(logo, max_guesses)
    setup_screen
    View.show_full_image(logo, max_guesses)
    puts
    puts
    puts
    puts "Press 1 to play game".center(75)
    puts "Press 2 for instructions".center(75)
    puts "Press 3 for game info".center(75)
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
    puts
    puts
  end

  def self.lose(parser, max_guesses, answer)
    show_full_image(parser, max_guesses)
    puts
    puts "Sorry. The answer was '#{answer}.'".center(100)
    sleep(3)
  end

  def self.clear_screen!
    print "\e[2J"
  end

  def self.move_to_home!
    print "\e[H"
  end

  def self.score(score)
    puts "Your score for this round is: #{score}".center(75)
  end

  def self.total_score(score)
    puts "Your total score is: #{score}".center(75)
    sleep(2)
  end

  def self.game_over(logo, max_guesses, score)
    setup_screen
    View.show_full_image(logo, max_guesses)
    puts
    puts
    puts "Thanks for playing!".center(75)
    puts
    View.total_score(score)
  end


end


