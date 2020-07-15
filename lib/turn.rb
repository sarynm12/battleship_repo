class Turn
  attr_reader :computer, :user, :user_shot, :computer_shot

  def initialize(computer, user)
    @computer = computer
    @user = user
  end

  def full_turn
    puts "=============COMPUTER BOARD==========="
    puts computer.board.render
    puts "==============USER BOARD=============="
    puts user.board.render(true)
    puts "Enter the coordinate for your shot:"
    print "> "
    user_takes_shot
    computer_takes_shot
    display_user_results
    display_computer_results
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

    Enter the coordinates for the Cruiser (3 spaces), for example: A1 B1 C1"

    print "> "

    user_cruiser_coordinates = []
    loop do
      user_cruiser_coordinates = gets.chomp.upcase.split(" ")
      if user.board.valid_placement?(user.cruiser, user_cruiser_coordinates)
        user.board.place(user.cruiser, user_cruiser_coordinates)
        break
      else
        puts "Invalid coordinates, try again:"
        print "> "
      end
      user.board.place(user.cruiser, user_cruiser_coordinates)
      puts user.board.render(true)
    end

    puts "Enter the coordinates for the Submarine(2 spaces). For example: A1 B1"
    print "> "

    user_sub_coordinates = []
    loop do
      user_sub_coordinates = gets.chomp.upcase.split(" ")
      if user.board.valid_placement?(user.submarine, user_sub_coordinates)
        break
      else
        puts "Invalid coordinates, try again:"
        print "> "
      end
    end
    user.board.place(user.submarine, user_sub_coordinates)
    puts user.board.render(true)
  end

  def user_takes_shot
    @user_shot = gets.chomp.upcase
    # while computer.board.valid_coordinate?(user_shot) == false || computer.board.cells[user_shot].fired_upon?
      while computer.board.cells[@user_shot].fired_upon?
        puts "This coordinate has already been fired upon."
        puts "Please enter another coordinate."
        print "> "
      while computer.board.valid_coordinate?(@user_shot) == false
        puts "Please enter a valid coordinate:"
        print "> "
      end
      if (computer.board.valid_coordinate?(@user_shot) && computer.board.cells[@user_shot].fired_upon? == false)
        computer.board.cells[@user_shot].fire_upon
        puts computer.board.cells[@user_shot].render
      end
    end
  end

  def computer_takes_shot
    loop do
    @computer_shot = rand(65..68).chr + (rand(1..4)).to_s
      if user.board.valid_coordinate?(@computer_shot) && user.board.cells[@computer_shot].fired_upon? == false
        break
      end
      user.board.cells[@computer_shot].fire_upon
      puts user.board.cells[@computer_shot].render(true)
    end
  end

  def display_user_results
    if computer.board.cells[@user_shot].render == "M"
      @user_message = "was a miss."
    elsif computer.board.cells[@user_shot].render == "H"
      @user_message = "was a hit!"
    elsif computer.board.cells[@user_shot].render == "X"
      @user_message = "has sunk my battleship!"
    end
  end

  def display_computer_results
    if user.board.cells[@computer_shot].render == "M"
      @computer_message = "was a miss."
    elsif user.board.cells[@computer_shot].render == "H"
      @computer_message = "was a hit!"
    elsif user.board.cells[@computer_shot].render == "X"
      @computer_message = "has sunk your battleship!"
    end

    puts " "
    puts "============ RESULTS ============"
    puts "Your shot on #{@user_shot} #{@user_message}"
    puts "My shot on #{@computer_shot} #{@computer_message}"

  end
end
