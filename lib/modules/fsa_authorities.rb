#Not sure if this is the right thing to do (make this a module) 
# as its not really shared behaviour.
# However if the required headers/ url change it should be easy to update.
module FSA_Authorities

	URL = 'http://api.ratings.food.gov.uk/authorities/basic'

	HEADERS = { 'accept' => 'application/json', 
				'content-type' => 'application/json', 
				'x-api-version' => '2',
				'content-length' => '1964' }
end