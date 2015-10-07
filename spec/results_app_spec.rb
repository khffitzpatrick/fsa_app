describe Results_App do

	include_context 'ratings xml'

	let (:subject) {described_class.new}
	let (:env) { {"QUERY_STRING" => '?id=277'} }

	describe '#call' do

		include_context 'successful authorities api call'
    	context 'the FSA api returns a list of ratings' do
    		include_context 'successful ratings api call'

			it 'loads a list of ratings' do
				expect(subject).to receive(:get_ratings).and_call_original	
				subject.call env
			end

			it 'displays the ratings' do
				expect(subject).to receive(:get_ratings).and_return(expected_ratings_full)	
				expect(subject).to receive(:render_template).with(Template_Library::RESULTS)
				subject.call env
			end
		end

		context 'there is an error retrieving ratings from the FSA api' do
			include_context 'unsuccessful ratings api call'

			it 'displays an error' do
				expect(subject).to receive(:get_ratings).and_return({})	
				expect(subject).to receive(:render_template).with(Template_Library::ERROR)
				subject.call env
			end

			it 'returns an internal server error status code' do
				expect(subject).to receive(:get_ratings).and_return({})	
				result = subject.call env
				expect(result[0]).to eq('500')
			end
		end

	end

end