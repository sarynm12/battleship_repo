require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_it_holds_a_coordinate
    cell = Cell.new("B4")
    assert_equal "B4", cell.coordinate
  end

  def test_it_starts_with_no_ships
    cell = Cell.new("B4")
    assert_nil cell.ship
  end

  def test_it_starts_empty
    cell = Cell.new("B4")
    assert_equal true, cell.empty?
  end

  def test_it_knows_when_a_ship_has_been_placed
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
    assert_equal false, cell.empty?
  end

  def test_it_knows_if_it_has_been_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal 2, cell.ship.health
    assert_equal true, cell.fired_upon?
  end
end
