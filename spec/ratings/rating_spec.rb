describe Rating do

	let (:rating_1) {described_class.new('5-star', '15%')}
	let (:rating_2) {described_class.new('5-star', '15%')}
	let (:rating_3) {described_class.new('4-star', '15%')}
	let (:rating_4) {described_class.new('5-star', '25%')}
	
	describe '#==' do

		context 'comparing two rating objects which have the same values' do
			it 'returns true' do
				expect(rating_1 == rating_2).to be true
			end
		end
		
		context 'comparing an object with itself' do
			it 'returns true' do
				expect(rating_1 == rating_1).to be true
			end
		end

		context 'comparing two rating objects with different values' do
			it 'returns false' do
				expect(rating_1 == rating_3).to be false
				expect(rating_1 == rating_4).to be false
			end
		end
		
	end			

end