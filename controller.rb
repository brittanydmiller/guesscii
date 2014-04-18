require_relative 'db/config'
require_relative 'db/picture_importer'
require_relative 'view'
require_relative 'game'
require_relative 'picture'


class Controller
  attr_reader :max_guesses, :game

  def initialize
    @max_guesses = 5
    @total_score = 0
    @logo = PictureManager.new('logo.txt')
    View.welcome(@logo, @max_guesses)
    run_game

  end

  def run_game
    case View.get_input.to_i
      when 1
        (1..8).to_a.shuffle.each do |index|
          @guess_count = 1
          setup_game(index)
          play_game
        end
        View.game_over(@logo, @max_guesses, @total_score)
      when 2
        View.instructions
      when 3
        View.game_info
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
      View.win(@parser, @max_guesses)
      View.score(@game.score)
      @total_score += @game.score
      View.total_score(@total_score)
    elsif @guess_count > @max_guesses + 1
      View.lose(@parser, @max_guesses, @picture.answer)
    else
      @game.reduce_score
      if @game.score == 0
        View.score(@game.score)
        View.total_score(@total_score)
      else
        play_game
      end
    end
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
