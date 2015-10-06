require_relative 'ratings_service'
require_relative '../controller'

class Ratings_Controller < Controller

	def initialize url, headers
		@url = url
		@headers = headers
	end

	def load_ratings

		ratings_proc = Proc.new do |response_body|
			ratings_service = Ratings_Service.new response_body
			ratings_service.parse_ratings
		end

		load_values url, headers, {}, &ratings_proc	
	end
end