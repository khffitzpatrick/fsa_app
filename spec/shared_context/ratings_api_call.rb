shared_context 'successful ratings api call' do

    include_context 'ratings xml'
    
  	before do
        stub_request(:get, "http://api.ratings.food.gov.uk/authorities/basic").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Length'=>'1964', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby', 'X-Api-Version'=>'2'}).
        to_return(:status => 200, :body => ratings_xml, :headers => {})     
   	end

end

shared_context 'unsuccessful ratings api call' do
  	
  	before do
        stub_request(:get, "http://api.ratings.food.gov.uk/authorities/basic").
        with(:headers => {'Accept'=>'application/json', 
        	'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
        	'Content-Length'=>'1964', 'Content-Type'=>'application/json', 
        	'User-Agent'=>'Ruby', 'X-Api-Version'=>'2'}).
        to_return(:status => 404, :body => [], :headers => {})     
   	end

end