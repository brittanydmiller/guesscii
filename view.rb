##Future: Clear screen, move to home

class View

  def self.welcome
    puts "Welcome to Guesscii\nPress 'Enter' to continue"
  end

  def self.image_piece(parser, line = 0)
    counter = line
    increment = parser.lines / 5

    increment.times do
      puts parser.picture[counter]
      counter += 1
    end
    counter
  end

  def self.get_input
    gets.chomp
  end

  def self.win
    puts "You WON!!!!!!"
  end

end


