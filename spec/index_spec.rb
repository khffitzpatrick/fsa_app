describe Index do

	let (:subject) {described_class.new}
	let (:env) { {} }
	let (:mock_authorities) { [Authority.new('Aberdeen City', 197), 
							   Authority.new('Allerdale', 158)] }

	describe '#call' do
		
    	context 'the FSA api returns a list of authorities' do
    		include_context 'successful fsa api call'

			it 'loads a list of authorities' do
				expect(subject.app).to receive(:load_authorities).and_call_original	
				subject.call env
			end

			it 'displays the authorities' do
				expect(subject.app).to receive(:load_authorities).and_return(mock_authorities)	
				expect(subject).to receive(:render_template).with(Template_Library::INDEX)
				subject.call env
			end
		end

		context 'there is an error retriving authorities from the FSA api' do
			it 'displays an error' do
				expect(subject.app).to receive(:load_authorities).and_return([])	
				expect(subject).to receive(:render_template).with(Template_Library::ERROR)
				subject.call env
			end

			it 'returns an internal server error status code' do
				expect(subject.app).to receive(:load_authorities).and_return([])	
				result = subject.call env
				expect(result[0]).to eq('500')
			end
		end

	end

end