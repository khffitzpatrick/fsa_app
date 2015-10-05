require 'erb'
require 'net/http'
require 'pry'
require 'json'
require_relative 'authorities_controller'
require_relative 'template_library'

#Retrieve a list of local authorities and display them to the user
class Index
 include Template_Library

	attr_accessor :app 

	def initialize
		@app = Authorities_Controller.new
	end

	def call env 
		@authorities = @app.load_authorities
		status_code = @authorities.empty? ? '500' : '200'
		template = @authorities.empty? ? ERROR : INDEX
		[status_code, {'Content-Type' => 'text/html'}, 
			[render_template(template)]]
	end

#Move to somewhere else/ make private
	def render_template template
		path = File.expand_path("views/#{template}")
		ERB.new(File.read(path)).result(binding)
	end

end
