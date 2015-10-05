describe Authorities_Service do

	include_context 'authorities json'
	let (:subject) {described_class.new(mock_authorities_json)}

	describe '#parse_authorities' do
		it 'parses the authorities json' do
			expect(subject.parse_authorities).to be == mock_authorities
		end
	end
end