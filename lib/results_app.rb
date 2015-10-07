require_relative 'ratings/ratings_controller'
require_relative 'authorities/authorities_controller'
require_relative 'modules/template_library'

#Retrieves the ratings results for an authority and displays as a table
class Results_App
 include Template_Library

 	attr_accessor :ratings_controller
 	
	def initialize
		@authorities_controller = Authorities_Controller.new
	end

	def call env 
		@ratings = get_ratings env
		status_code = @ratings.empty? ? '500' : '200'
		template = @ratings.empty? ? ERROR : RESULTS
		[status_code, {'Content-Type' => 'text/html'}, 
			[render_template(template)]]
	end

private
	def get_ratings env
		auth_id = get_auth_id env
		authority = @authorities_controller.load_filename auth_id
		@authority_name = authority.name
		@ratings_controller = Ratings_Controller.new authority.filename
		@ratings_controller.load_ratings
	end

	def get_auth_id env
		id_str = env["QUERY_STRING"]
		id = id_str.gsub(/[^\d]/, '')
	end

end
