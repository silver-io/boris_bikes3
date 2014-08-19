class Van

	include BikeContainer

	def pickup_broken_bikes(station)
		station.release_broken_bikes.each do |bike|
			bikes << bike
		end

	end


end
