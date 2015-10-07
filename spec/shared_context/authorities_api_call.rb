shared_context 'successful authorities api call' do

    include_context 'authorities json'
    
  	before do
        stub_request(:get, "http://api.ratings.food.gov.uk/authorities/basic").
        with(:headers => {'Accept'=>'application/json', 
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
            'Content-Type'=>'application/json', 'User-Agent'=>'Ruby', 
            'X-Api-Version'=>'2'}).
        to_return(:status => 200, :body => mock_authorities_list_json, :headers => {})     
   	end

    before do
        stub_request(:get, "http://api.ratings.food.gov.uk/authorities/?id=277").
        with(:headers => {'Accept'=>'application/json', 
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
            'Content-Type'=>'application/json', 
            'User-Agent'=>'Ruby', 'X-Api-Version'=>'2'}).
        to_return(:status => 200, :body => mock_authority_json, :headers => {})     
    end

end

shared_context 'unsuccessful authorities api call' do
  	
  	before do
        stub_request(:get, "http://api.ratings.food.gov.uk/authorities/basic").
        with(:headers => {'Accept'=>'application/json', 
        	'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
        	'Content-Type'=>'application/json', 
        	'User-Agent'=>'Ruby', 'X-Api-Version'=>'2'}).
        to_return(:status => 404, :body => [], :headers => {})     
   	end

    before do
        stub_request(:get, "http://api.ratings.food.gov.uk/authorities/?id=277").
        with(:headers => {'Accept'=>'application/json', 
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
            'Content-Type'=>'application/json', 
            'User-Agent'=>'Ruby', 'X-Api-Version'=>'2'}).
        to_return(:status => 404, :body => [], :headers => {})     
    end

end