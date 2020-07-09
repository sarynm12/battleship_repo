require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_has_cells
    board = Board.new
    assert_equal 16, board.cells.keys.count
    assert_equal 16, board.cells.values.count
  end

  def test_it_knows_if_coordinate_is_valid
    board = Board.new
    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_it_knows_if_coordinates_are_same_length_as_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_coordinate_length?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_coordinate_length?(submarine, ["A2", "A3", "A4"])
    assert_equal true, board.valid_coordinate_length?(cruiser, ["B1", "B2", "B3"])
  end

  def test_it_knows_if_coordinates_are_consecutive
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.coordinates_consecutive?(["A1", "A2", "A4"])
    assert_equal false, board.coordinates_consecutive?(["A1", "C1"])
    assert_equal false, board.coordinates_consecutive?(["A3", "A2", "A1"])
    assert_equal false, board.coordinates_consecutive?(["A1", "B2", "C3"])
    assert_equal false, board.coordinates_consecutive?(["C2", "D3"])
  end


end
