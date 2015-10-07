require_relative 'ratings_service'
require_relative '../controller'

class Ratings_Controller < Controller

	def initialize ratings_url
		@url = ratings_url
	end

	#Get the ratings for a local authority using the ratings url and 
	# pass to the Ratings_Service, which tallies them and returns grouped by 
	# star value.
	def load_ratings
		ratings_proc = Proc.new do |response_body|
			ratings_service = Ratings_Service.new response_body
			ratings_service.parse_ratings
		end

		load_values @url, {}, {}, &ratings_proc	
	end
end