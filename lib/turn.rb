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


end


# - display Board
# - ask for user coordinates (gets.chomp)
# check coordinate validity
# - have players place Ship
# - computer will loop through coordinates once
# it selects a valid placement, then places ships

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

# - report RESULTS, prints "message"
#
# - after both player and computer take their turns,
# board will be rendered.

# ------end of turn------
# (loop all until end of game)
