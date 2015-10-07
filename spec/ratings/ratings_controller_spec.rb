describe Ratings_Controller do

	include_context 'ratings xml'
	let (:subject) {described_class.new sample_url}
	
	describe '#load_ratings' do
		
    	context 'the FSA api returns the ratings file' do
    		include_context 'successful ratings api call'

			it 'returns the sorted ratings' do
				expect(subject.load_ratings).to be == expected_ratings_full
			end

		end

		context 'there is an error retrieving ratings from the FSA api' do
			include_context 'unsuccessful ratings api call'

			it 'returns an empty array' do
				expect(subject.load_ratings).to be_kind_of(Hash)
				expect(subject.load_ratings).to be_empty
			end
		end

	end

end