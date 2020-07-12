require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new
    assert_instance_of Turn, turn
  end

  def test_computer_can_place_ships
    turn = Turn.new
    computer = Player.new
    user = Player.new
    require "pry"; binding.pry
  end
end
