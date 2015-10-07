shared_context 'successful ratings api call' do
    
    include_context 'ratings xml'

  	before do
        stub_request(:get, sample_url).
        with(:headers => {'Accept'=>'*/*', 
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
          'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => ratings_full, :headers => {})     
   	end

end

shared_context 'unsuccessful ratings api call' do
  	
    include_context 'ratings xml'

  	before do
        stub_request(:get, sample_url).
        with(:headers => {'Accept'=>'*/*', 
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
          'User-Agent'=>'Ruby'}).
        to_return(:status => 404, :body => [], :headers => {})     
   	end

end