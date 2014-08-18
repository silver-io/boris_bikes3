require 'bike'

describe Bike do 

it "should not be broken after we create it" do
	bike = Bike.new
	expect(bike).not_to be_broken
	end

it "can break" do
	bike = Bike.new
	bike.break!
	expect(bike).to be_broken
	end

it "can be fixed" do
	bike = Bike.new
	bike.break!
	bike.fix!
	expect(bike).not_to be_broken
	end

end
