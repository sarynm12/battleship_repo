require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    computer = Player.new
    user = Player.new
    turn = Turn.new(computer, user)
    assert_instance_of Turn, turn
  end

  def test_computer_can_place_ships
    computer = Player.new
    user = Player.new
    turn = Turn.new(computer, user)
    turn.computer_place_ships
    assert_equal false, computer.board.cells.empty?
  end

  def test_user_can_place_ships
    computer = Player.new
    user = Player.new
    turn = Turn.new(computer, user)
    turn.user_place_ships
    turn.computer_place_ships
    assert_equal false, user.board.cells.empty?
  end

  def computer_can_place_ships
    computer = Player.new
    user = Player.new
    turn = Turn.new(computer, user)
    turn.stubs(:computer_sub_coordinates).returns(["D1", "D2"])
    turn.computer_place_ships
    assert_equal false, computer.board.cells.empty?
  end

end
