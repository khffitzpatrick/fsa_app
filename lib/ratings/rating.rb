class Rating

	attr_accessor :star_value, :percentage

	def initialize star_value, percentage
		@star_value = star_value
		@percentage = percentage
	end

	#As per comment on Authority:
	# Need a comparison for ratings_service_spec.rb
	def == other_rating
		@star_value == other_rating.star_value && @percentage == other_rating.percentage
	end

end	