describe Authorities_Service do

	include_context 'authorities json'
	let (:subject) {described_class.new}
	let (:authority) {Authority.new('Adur', 277, expected_filename)}

	describe '#parse_authorities' do
		it 'parses the authorities json' do
			expect(subject.parse_authorities(mock_authorities_list_json)).to be == expected_authorities
		end
	end

	describe '#parse_filename' do
		it 'parses the filename from the authority json' do
			expect(subject.parse_filename(mock_authority_json)).to be == authority
		end
	end
end