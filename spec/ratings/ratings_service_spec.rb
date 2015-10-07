describe Ratings_Service do

	include_context 'ratings xml'
	let (:subject_with_full_data) {described_class.new(ratings_full)}
	let (:subject_with_partial_data) {described_class.new(ratings_partial)}
	let (:subject_with_empty_data) {described_class.new(ratings_empty)}
	let (:subject_with_invalid_data) {described_class.new(ratings_no_total)}

	describe '#parse_ratings' do
		
		context 'there are establishment ratings for each star value' do
			it 'displays all the percentages' do
				expect(subject_with_full_data.parse_ratings).to be == expected_ratings_full
			end
		end

		context 'there are establishment ratings for some star values' do
			it 'displays zero percent where there is no data' do
				expect(subject_with_partial_data.parse_ratings).to be == expected_ratings_partial
			end
		end

		context 'there are no establishments for the authority' do
			it 'returns an empty object' do
				expect(subject_with_empty_data.parse_ratings).to eq({})
			end
		end
		
		context 'there is no total count of establishments for the authority' do
			it 'returns an empty object' do
				expect(subject_with_invalid_data.parse_ratings).to eq({})
			end
		end
	end


end