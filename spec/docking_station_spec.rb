require 'docking_station'

describe DockingStation do

	let(:bike) { Bike.new }
	let(:station) { DockingStation.new(:capacity => 20) }

  it "accepts a bike" do
	expect(station.bike_count).to eq(0)
	station.dock(bike)
	expect(station.bike_count).to eq(1)
  end

  it "releases a bike" do
  	station.dock(bike)
  	station.release(bike)
  	expect(station.bike_count).to eq(0)
  end

  it "knows when it's full" do
  	expect(station).not_to be_full
  	20.times { station.dock(Bike.new) }
  	expect(station).to be_full
  end

end
