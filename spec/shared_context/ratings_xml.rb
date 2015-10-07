shared_context 'ratings xml' do

  	let (:ratings_full) do
        open_file 'ratings_full'
   	end

    let (:ratings_partial) do
        open_file 'ratings_partial'
    end

    let (:ratings_empty) do
        open_file 'ratings_empty'
    end

    let (:ratings_no_total) do
        open_file 'ratings_no_total'
    end

    def open_file file_path 
        File.open("#{__dir__}/../sample_data/#{file_path}.xml")
    end

    let (:sample_url) {'http://ratings.food.gov.uk/OpenDataFiles/FHRS323en-GB.xml'}

    let (:expected_ratings_full) {    
    	[Rating.new("Exempt", "6%"), 
    	 Rating.new("5-star", "52%"),
       Rating.new("4-star", "21%"),
       Rating.new("3-star", "12%"),
       Rating.new("2-star", "3%"),
       Rating.new("1-star", "6%")]
    }

    let (:expected_ratings_partial) {    
        [Rating.new("Exempt", "0%"), 
         Rating.new("5-star", "60%"),
         Rating.new("4-star", "20%"),
         Rating.new("3-star", "20%"),
         Rating.new("2-star", "0%"),
         Rating.new("1-star", "0%")] 
    }
    
end