require_relative 'authorities/authorities_controller'
require_relative 'results_app'
require_relative 'modules/template_library'

#Retrieve a list of local authorities and display them to the user
class Index_App
 include Template_Library

 	attr_accessor :authorities_controller
 	
	def initialize
		@authorities_controller = Authorities_Controller.new
		@selected = nil
	end

	def call env 
		@authorities = @authorities_controller.load_authorities
		status_code = @authorities.empty? ? '500' : '200'
		template = @authorities.empty? ? ERROR : INDEX
		[status_code, {'Content-Type' => 'text/html'}, 
			[render_template(template)]]
	end

end
