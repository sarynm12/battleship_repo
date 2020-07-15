require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :computer, :user, :user_input, :user_shot, :computer_shot, :turn

  def initialize
    @computer = Player.new
    @user = Player.new
  end

  def start
    while @user_input != 'q'
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit"
    print "> "
    @user_input = gets.chomp
      while !(@user_input == "q" || @user_input ==  "p")
       puts "Invalid input, try again:"
       print "> "
      end
      if @user_input == "p"
        @turn = Turn.new(computer, user)
        @turn.computer_place_ships
        @turn.user_place_ships
        play
      end
    end
    puts "Thanks for playing."
  end

  def play
    computer_render = nil
    user_render = nil
    while !(computer_render == 5 || user_render == 5)
      @turn.full_turn
      computer_render = @computer.board.render.count "X"
      user_render = @user.board.render.count "X"
    end
    end_game(computer_render, user_render)
  end

  def end_game(computer_render, user_render)
    if computer_render == 5
      puts "You win!"
    elsif user_render == 5
      puts "I win!"
    end
  end

end
