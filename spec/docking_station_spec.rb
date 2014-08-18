require 'docking_station'

describe DockingStation do

def fill_station(station)
	20.times { station.dock(Bike.new) }
end

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
  	fill_station station
  	expect(station).to be_full
  end

  it "doesn't accept a bike when full" do
  	fill_station station
    expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)    
  end


end
