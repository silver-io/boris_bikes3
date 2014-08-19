require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	def fill_holder(holder)
  		holder.capacity.times { holder.dock(Bike.new) }
	end

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	  it "accepts a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	  end

	  it "releases a bike" do
	  	holder.dock(bike)
	  	holder.release(bike)
	  	expect(holder.bike_count).to eq(0)
	  end

	  it "knows when it's full" do
	  	expect(holder).not_to be_full
	  	fill_holder holder
	  	expect(holder).to be_full
	  end

	  it "knows when it's empty" do
	  	expect(holder.empty?).to be true
	  end

	  it "doesn't accept a bike when full" do
	  	fill_holder holder
	    expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)    
	  end

	  it "won't release a bike that's broken" do
	  	working_bike, broken_bike = Bike.new, Bike.new
	  	broken_bike.break!
	  	holder.dock(working_bike)
	  	holder.dock(broken_bike)
	  	expect{ holder.release(broken_bike)}.to raise_error
	  end

	  it "provides the list of available bikes" do
	  	working_bike, broken_bike = Bike.new, Bike.new
	  	broken_bike.break!
	  	holder.dock(working_bike)
	  	holder.dock(broken_bike)
	  	expect(holder.available_bikes).to eq([working_bike])
	  end

	  it "should raise an error if dock is passed without arguments" do
	  	expect{ dock() }.to raise_error
	  end

	  xit "should not dock a bike that is already docked" do
	  	bike1 = Bike.new
	  	holder.dock(bike1)
	  	expect{ holder.dock(bike1) }.to raise_error
	  end

	  it "should not release a bike that's not there" do
	  	bike1 = Bike.new
	  	expect{ holder.release(bike1) }.to raise_error
	  end

	  it "returns empty when it has no bikes" do
	  	holder.dock(bike)
	  	holder.release(bike)
	  	expect(holder.empty?).to be true
	  end

	  it "returns empty after releasing broken bikes" do
	  	broken_bike = Bike.new
	  	broken_bike.break!
	  	holder.dock(broken_bike)
	  	holder.release_broken_bikes
	  	p holder.broken_bikes
	  	expect(holder.empty?).to be true
	  end

	  	

end
