shared_context 'authorities json' do

  	let (:mock_authorities_json) do
    	'{"authorities":'+
        '[{"LocalAuthorityId":197,"LocalAuthorityIdCode":"760","Name":"Aberdeen City",'+
    	'"EstablishmentCount":1698,"SchemeType":2,"links":'+
    	'[{"rel":"self","href":"http://api.ratings.food.gov.uk/authorities/197"}]},'+
    	'{"LocalAuthorityId":198,"LocalAuthorityIdCode":"761","Name":"Aberdeenshire",'+
    	'"EstablishmentCount":1979,"SchemeType":2,"links":'+
    	'[{"rel":"self","href":"http://api.ratings.food.gov.uk/authorities/198"}]},'+
    	'{"LocalAuthorityId":277,"LocalAuthorityIdCode":"323","Name":"Adur",'+
    	'"EstablishmentCount":391,"SchemeType":1,"links":'+
    	'[{"rel":"self","href":"http://api.ratings.food.gov.uk/authorities/277"}]}]}'
   	end

    let (:mock_authorities) do
        [Authority.new("Aberdeen City", 197),
        Authority.new("Aberdeenshire", 198),
        Authority.new("Adur", 277)]
    end

end