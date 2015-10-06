require 'net/http'

#Super class of controller. Agnostic of the request details, service and 
# response format.
# Child classes are responsible for thier own service implementations and 
# the specific format of the return value.
# No individual tests - coverage provided in child classes specs.
class Controller

	def load_values url, headers, return_value, &service
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)

		begin 
			http.read_timeout = 120
			response = http.request_get uri.request_uri, headers
			return_value = service.call response.body
		rescue
			#Return the passed in return_value (empty array or hash)
		end
		return_value		
	end

end