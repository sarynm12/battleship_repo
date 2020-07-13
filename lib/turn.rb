class Turn
  attr_reader :computer, :user

  def initialize(computer, user)
    @computer = computer
    @user = user
  end

  def computer_place_ships
    loop do
      computer_sub_coordinates =
      [rand(65..68).chr + (rand(1..4).to_s).concat,
      rand(65..68).chr + (rand(1..4).to_s).concat]
      if computer.board.valid_placement?(computer.submarine, computer_sub_coordinates)
        computer.board.place(computer.submarine, computer_sub_coordinates)
        break
      end
    end
    loop do
      computer_cruiser_coordinates =
      [rand(65..68).chr + (rand(1..4).to_s).concat,
      rand(65..68).chr + (rand(1..4).to_s).concat,
      rand(65..68).chr + (rand(1..4).to_s).concat]
      if computer.board.valid_placement?(computer.cruiser, computer_cruiser_coordinates)
        computer.board.place(computer.cruiser, computer_cruiser_coordinates)
        break
      end
    end
  end

  def user_place_ships
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long.

      1 2 3 4
    A . . . .
    B . . . .
    C . . . .
    D . . . .

    Enter the coordinates for the Submarine (2 spaces), for example 'A1, B1':"

    print "> "

    user_sub_coordinates = []
    loop do
      user_sub_coordinates = gets.chomp.upcase.split(" ")
      if user.board.valid_placement?(user.submarine, user_sub_coordinates)
        user.board.place(user.submarine, user_sub_coordinates)
        break
      else
        puts "Invalid coordinates, try again:"
        puts ">"
      end
      user.board.place(user.submarine, user_sub_coordinates)
      puts user.board.render(true)
    end


    puts "Enter the coordinates for the Cruiser(3 spaces):"
    print "> "

    user_cruiser_coordinates = []
    loop do
      user_cruiser_coordinates = gets.chomp.upcase.split(" ")
      if user.board.valid_placement?(user.cruiser, user_cruiser_coordinates)
        break
      else
        puts "Invalid coordinates, try again:"
        puts ">"
      end
    end
    user.board.place(user.cruiser, user_cruiser_coordinates)
    puts user.board.render(true)
  end



end




# - display Board
# - ask for user coordinates (gets.chomp)
# check coordinate validity
# - have players place Ship
#
#
# - user will select coordinates they wish to fire
# upon on computers board (gets.chomp)
# - need to check user input to see if valid
# coordinate.
# - if not, will have to keep asking user for an
#   input, until they input a valid coordinate.
# - create method to check fired_upon? == false
# - if valid, will have coordinate fired upon.
#
# - then computer will take it's turn
#
# - report RESULTS, prints "message"
#
# - after both player and computer take their turns,
# board will be rendered.

# ------end of turn------
# (loop all until end of game)
