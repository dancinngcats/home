class Building
  attr_reader :units,
              :renters

  def initialize
    @units = []
    @renters = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.map do |unit|
      if unit.renter != nil
        @renters << unit.renter.name
    end.flatten
  end
end

  def average_rent
    monthly_total_rent = units.sum do |unit|
      unit.monthly_rent.to_f
    end

    monthly_total_rent / units.count
  end

  def rented_units
  rented_units = []
    @units.each do |unit|
      if unit.renter != nil
      rented_units << unit
    end
  end
    rented_units.compact
end


  # def renter_with_highest_rent
  #   @units.each do |unit|
  #     most_expensive = unit.max_by do |unit|
  #       unit.rent
  # end
  #
  # def units_by_number_of_bedrooms
  #
  # end

end
