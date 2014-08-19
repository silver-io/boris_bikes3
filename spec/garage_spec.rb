require 'garage'

	describe Garage do 

	it "should fix bikes when it docks them" do
		garage = Garage.new
		bike = Bike.new
		bike.break!
		garage.dock(bike)
		expect(bike).not_to be_broken
	end

end


