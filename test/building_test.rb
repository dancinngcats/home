require_relative 'test_helper'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new

    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})

    @renter1 = Renter.new("Aurora")
    @renter2 = Renter.new("Tim")
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_has_no_units
    assert_equal [], @building.units
  end

  def test_it_can_add_units
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)

    assert_equal [@unit1, @unit2], @building.units
  end

  def test_it_can_return_renters
    assert_equal [], @building.renters

    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @unit1.add_renter(@renter1)

    assert_equal ["Aurora"], @building.renters

    @unit2.add_renter(@renter2)

    assert_equal ["Aurora", "Tim"], @building.renters
  end

  def test_it_can_return_average_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)

    assert_equal 1099.5, @building.average_rent
  end

  def test_it_can_return_rented_units
    assert_equal [], @building.rented_units

    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    renter1 = Renter.new("Spencer")
    @unit2.add_renter(renter1)

    assert_equal [@unit2], @building.rented_units
  end

  # def test_it_can_return_renter_with_highest_rent
  #   renter1 = Renter.new("Spencer")
  #   renter2 = Renter.new("Jessie")
  #   renter3 = Renter.new("Max")
  #
  #   @building.add_unit(@unit1)
  #   @building.add_unit(@unit2)
  #   @building.add_unit(@unit3)
  #
  #   assert_equal "Jessie", @building.renter_with_highest_rent
  # end
  #
  # def test_it_can_return_units_by_number_of_bedrooms
  #   @building.add_unit(@unit1)
  #   @building.add_unit(@unit2)
  #   @building.add_unit(@unit3)
  #
  #   expected = =>
  #   {
  #     3 => ["D4" ],
  #     2 => ["B2", "C3"],
  #     1 => ["A1"]
  #   }
  #
  #   assert_equal expected, @building.units_by_number_of_bedrooms
  # end
end
