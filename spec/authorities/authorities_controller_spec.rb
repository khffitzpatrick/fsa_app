describe Authorities_Controller do

	let (:subject) {described_class.new}
	include_context 'authorities json'

	describe '#load_authorities' do
		
    	context 'the FSA api returns a list of authorities' do
    		include_context 'successful authorities api call'

			it 'loads a list of authorities' do
				expect(subject.load_authorities).to be == expected_authorities
			end

			it 'creates authority objects from the list' do
				expect(subject.load_authorities).to be == expected_authorities
			end


			it 'returns the authority objects as an array' do
				expect(subject.load_authorities).to be_kind_of(Array)
			end
		end

		context 'there is an error retriving authorities from the FSA api' do
			include_context 'unsuccessful authorities api call'

			it 'returns an empty array' do
				expect(subject.load_authorities).to be_kind_of(Array)
				expect(subject.load_authorities).to be_empty
			end
		end

	end

end