class Van

	include BikeContainer

	def pickup_broken_bikes(station)
		station.release_broken_bikes.each do |bike|
			raise "Van is full" if self.full?
			bikes << bike
		end

	end


end
