shared_context 'authorities json' do

  	let (:mock_authorities_list_json) do
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

    let (:expected_authorities) do
        [Authority.new("Aberdeen City", 197),
        Authority.new("Aberdeenshire", 198),
        Authority.new("Adur", 277)]
    end

    let (:mock_authority_json) do
        '{"LocalAuthorityId":277,"LocalAuthorityIdCode":"323","Name":"Adur",'+
        '"FriendlyName":"adur","Url":"http://www.adur-worthing.gov.uk","SchemeUrl":"",'+
        '"Email":"envsupport@adur-worthing.gov.uk","RegionName":"South East",'+
        '"FileName":"http://ratings.food.gov.uk/OpenDataFiles/FHRS323en-GB.xml",'+
        '"FileNameWelsh":null,"EstablishmentCount":389,'+
        '"CreationDate":"2010-08-17T15:30:24.87",'+
        '"LastPublishedDate":"2015-10-03T00:34:08.83",'+
        '"SchemeType":1,"links":[{"rel":"self",'+
            '"href":"http://api.ratings.food.gov.uk/authorities/277"}]}'
    end

    let (:expected_filename) do
        "http://ratings.food.gov.uk/OpenDataFiles/FHRS323en-GB.xml"
    end

end