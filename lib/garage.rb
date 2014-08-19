class Garage

	include BikeContainer

def dock(bike)
	raise "Garage is full" if full?
	bike.fix!
	bikes << bike
end

end