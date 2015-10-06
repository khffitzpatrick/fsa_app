require_relative 'ratings/ratings_controller'
require_relative 'modules/template_library'

#Retrieves the results for an authority and displays as a table
class Results_App
 include Template_Library

 	attr_accessor :ratings_controller
 	
	def initialize
		@ratings_controller = Ratings_Controller.new url, headers
	end

	def call env 
		@ratings = @ratings_controller.load_ratings
		status_code = @ratings.empty? ? '500' : '200'
		template = @ratings.empty? ? ERROR : RESULTS
		[status_code, {'Content-Type' => 'text/html'}, 
			[render_template(template)]]
	end

end
