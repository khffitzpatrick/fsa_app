describe Authority do

	let (:authority_1) {described_class.new('York', 15)}
	let (:authority_2) {described_class.new('York', 15)}
	let (:authority_3) {described_class.new('Leeds', 15)}
	let (:authority_4) {described_class.new('York', '15')}

	describe '#==' do

		context 'comparing two authority objects which have the same values' do
			it 'returns true' do
				expect(authority_1 == authority_2).to be true
			end
		end
		
		context 'comparing an object with itself' do
			it 'returns true' do
				expect(authority_1 == authority_1).to be true
			end
		end

		context 'comparing two authority objects with different values' do
			it 'returns false' do
				expect(authority_1 == authority_3).to be false
				expect(authority_1 == authority_4).to be false
			end
		end
		
	end			

end