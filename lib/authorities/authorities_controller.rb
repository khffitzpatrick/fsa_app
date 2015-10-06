require_relative 'authorities_service'
require_relative '../modules/fsa_authorities'
require_relative '../controller'

#Gets the list of authorities from the FSA website and passes them to 
# the Authorities_Service. Authorities_Service turns the list 
# into authority objects and returns them to the index page.
class Authorities_Controller < Controller
	include FSA_Authorities

	def load_authorities2
 		[Authority.new("Aberdeen City", 197),
        Authority.new("Aberdeenshire", 198),
        Authority.new("Adur", 277)]    
	end

	def load_authorities
		authorities_proc = Proc.new do |response_body|
			authorities_service = Authorities_Service.new response_body
			authorities_service.parse_authorities
		end

		load_values URL, HEADERS, [], &authorities_proc	
	end


end