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

	describe '#load_filename' do
		
		let (:auth_id) {277}
		let (:authority) {Authority.new('Adur', auth_id, expected_filename)}

    	context 'the FSA api returns the authority' do
    		include_context 'successful authorities api call'    		

			it 'gets the results filename from the authority json' do
				expect(subject.load_filename auth_id).to be == authority
			end
		end

		context 'there is an error retriving authority from the FSA api' do
			include_context 'unsuccessful authorities api call'

			it 'returns an empty string' do
				expect(subject.load_filename auth_id).to be_kind_of(String)
				expect(subject.load_filename auth_id).to be_empty
			end
		end

	end

end