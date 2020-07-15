require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_ship_has_a_name
    cruiser = Ship.new("Cruiser", 3)
    assert_equal "Cruiser", cruiser.name
  end

  def test_ship_has_a_length
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.length
  end

  def test_ship_has_health
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.health
  end

  def test_whether_ship_has_sunk
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cruiser.sunk?
  end

  def test_ship_health_decreases_after_hit
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    assert_equal 2, cruiser.health

    cruiser.hit
    assert_equal 1, cruiser.health

    cruiser.hit
    assert_equal 0, cruiser.health
  end

  def test_ship_knows_when_sunk
    cruiser = Ship.new("Cruiser", 3)
    
    cruiser.hit
    cruiser.hit
    cruiser.hit
    assert_equal true, cruiser.sunk?
  end
end
