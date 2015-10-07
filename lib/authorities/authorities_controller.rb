require_relative 'authorities_service'
require_relative '../modules/fsa_authorities'
require_relative '../controller'

class Authorities_Controller < Controller
	include FSA_Authorities

	def initialize
		@authorities_service = Authorities_Service.new
	end

	#Gets the list of authorities from the FSA website and passes them to 
	# the Authorities_Service. Authorities_Service turns the list 
	# into authority objects and returns them to the index page.
	def load_authorities
		authorities_proc = Proc.new do |response_body|
			@authorities_service.parse_authorities response_body
		end

		load_values AUTH_LIST_URL, AUTH_HEADERS, [], &authorities_proc	
	end

	#Gets the full authority object from the FSA website and passes them to 
	# the Authorities_Service. Authorities_Service gets the filename  
	# of the results and returns it to the index page.
	def load_filename auth_id
		authorities_proc = Proc.new do |response_body|
			@authorities_service.parse_filename response_body
		end

		load_values AUTH_URL + "#{auth_id}", AUTH_HEADERS, '', &authorities_proc	
	end
end