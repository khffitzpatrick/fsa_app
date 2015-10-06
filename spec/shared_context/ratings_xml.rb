shared_context 'ratings xml' do

  	let (:ratings_xml_full) do
        open_xml 'ratings_full'
   	end

    let (:ratings_xml_partial) do
        open_xml 'ratings_partial'
    end

    let (:ratings_xml_empty) do
        open_xml 'ratings_empty'
    end

    let (:ratings_xml_no_total) do
        open_xml 'ratings_no_total'
    end

    def open_xml file_path 
        f = File.open("#{__dir__}/../sample_data/#{file_path}.xml")
        doc = Nokogiri::XML(f)
        f.close
        doc
    end

    let (:expected_ratings_full) {    
    	[Rating.new("Exempt", "6%"), 
    	 Rating.new("1-star", "6%"),
    	 Rating.new("2-star", "3%"),
    	 Rating.new("3-star", "12%"),
    	 Rating.new("4-star", "21%"),
    	 Rating.new("5-star", "52%")] 
    }

    let (:expected_ratings_partial) {    
        [Rating.new("Exempt", "0%"), 
         Rating.new("1-star", "0%"),
         Rating.new("2-star", "0%"),
         Rating.new("3-star", "20%"),
         Rating.new("4-star", "20%"),
         Rating.new("5-star", "60%")] 
    }
    
end