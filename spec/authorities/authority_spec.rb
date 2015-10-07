describe Authority do

	let (:authority_1) {described_class.new('York', 15)}
	let (:authority_2) {described_class.new('York', 15)}
	let (:authority_3) {described_class.new('Leeds', 15)}
	let (:authority_4) {described_class.new('York', '15')}
	let (:authority_5) {described_class.new('York', '15', 'url')}
	let (:authority_6) {described_class.new('York', '15', 'url')}
	
	describe '#==' do

		context 'comparing two authority objects which have the name and id' do
			it 'returns true' do
				expect(authority_1 == authority_2).to be true
			end
		end

		context 'comparing two authority objects which have the name, id and url' do
			it 'returns true' do
				expect(authority_5 == authority_6).to be true
			end
		end

		context 'comparing two authority objects when one has a url, same name and id' do
			it 'returns false' do
				expect(authority_1 == authority_6).to be false
			end
		end
		
		context 'comparing an object with itself' do
			it 'returns true' do
				expect(authority_1 == authority_1).to be true
				expect(authority_5 == authority_5).to be true
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