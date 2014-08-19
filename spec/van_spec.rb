require 'van'

describe Van do 

	let(:bike) { Bike.new }

	it "should tell the dock to release all broken bikes" do
		van = Van.new
		station = DockingStation.new
		broken_bike1, broken_bike2 = Bike.new, Bike.new
		broken_bike1.break!
		broken_bike2.break!
		station.dock(broken_bike1)
		station.dock(broken_bike2)
		expect(van.pickup_broken_bikes(station)).to eq [broken_bike1, broken_bike2]
	end

	it "should have broken bikes after the dock releases them" do
		van = Van.new
		station = DockingStation.new
		broken_bike1, broken_bike2 = Bike.new, Bike.new
		broken_bike1.break!
		broken_bike2.break!
		station.dock(broken_bike1)
		station.dock(broken_bike2)
		van.pickup_broken_bikes(station)
		expect(van.bikes).to eq [broken_bike1, broken_bike2]
	end

	it "should not accept bikes if it is full" do
		van = Van.new
		station = DockingStation.new
		bike.break!
		station.dock(bike)
		10.times{ van.dock(bike) }
		expect{ van.pickup_broken_bikes(station) }.to raise_error
	end


		

end

