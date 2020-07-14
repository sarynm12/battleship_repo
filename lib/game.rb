require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :computer, :user, :user_input

  def initialize
    @computer = Player.new
    @user = Player.new
    @user_input = nil
  end

  # welcome message
  # setup - computer and user place their ships
  # full_turn
  # user takes shot
  # computer takes shot
  # report the results

  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit"
    print "> "
    #@user_input = nil
    loop do
      @user_input = gets.chomp
      if @user_input == "q" || @user_input ==  "p"
        break
      else
       puts "Invalid input, try again:"
       puts ">"
     end
   end

   if @user_input == "q"
       puts  "Thanks for trying!"
     elsif @user_input == "p"
       turn = Turn.new(computer, user)
       turn.computer_place_ships
       turn.user_place_ships
       loop do
         turn.full_turn
         computer_render = computer_board.render.count "X"
         player_render = player_board.render.count "X"
         if computer_render == 5
             puts "You won!"
           break
         elsif player_render == 5
           puts "Computer won!"
           break
         end
       end
       start
     end
  #     user_input = gets.chomp
  #     while user_input != ('p' || 'q')
  #       puts "Invalid input, please try again"
  #       print "> "
  #     if user_input == 'p'
  #       play
  #     end
  #   end
  #   puts "Thanks for playing."
  # end

  # def setup
  #   computer.computer_place_ships
  #   user.user_place_ships
  # end

  # def play
  #   computer_render = nil
  #   user_render = nil
  #   while !(computer_render == 5 || user_render == 5)
  #     turn = Turn.new(computer, user)
  #     turn.full_turn
  #     computer_render = computer.board.render.count "X"
  #     user_render = user.board.render.count "X"
  #   end
  #   end_game(computer_render, user_render)
  # end
  #
  # def end_game(computer_render, user_render)
  #   if computer_render == 5
  #     puts "You win!"
  #   elsif user_render == 5
  #     puts "I win!"
  #   end
  # end

  end
end
