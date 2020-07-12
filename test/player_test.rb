require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_exists
    computer = Player.new
    user = Player.new
    assert_instance_of Player, computer
    assert_instance_of Player, user
  end

  def test_it_has_a_board
    computer = Player.new
    user = Player.new
    assert_instance_of Board, computer.board
    assert_instance_of Board, user.board
  end

  def test_it_has_a_cruiser
    computer = Player.new
    user = Player.new
    assert_instance_of Ship, computer.cruiser
    assert_instance_of Ship, user.cruiser
  end
  
  def test_it_has_a_submarine
    computer = Player.new
    user = Player.new
    assert_instance_of Ship, computer.submarine
    assert_instance_of Ship, user.submarine
  end
end
