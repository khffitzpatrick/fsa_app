require 'net/http'
require_relative 'authorities_service'
require_relative 'fsa_authorities'

#Gets the list of authorities from the FSA website and passes them to the Authorities_Service.
#Authorities_Service turns the list into authority objects and returns them to the index page.
class Authorities_Controller
	include FSA_Authorities

	def load_authorities
		uri = URI.parse(URL)
		http = Net::HTTP.new(uri.host, uri.port)

		authorities = []
		begin 
			http.read_timeout = 120
			response = http.request_get uri.request_uri, HEADERS
			authorities_service = Authorities_Service.new response.body
			authorities = authorities_service.parse_authorities
		rescue
			#Return an empty array
		end
		authorities		
	end

end