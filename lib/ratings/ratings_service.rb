require 'nokogiri'
require_relative '../modules/star_values'
require_relative 'rating'

#This tallys up the hygiene ratings and calculates the percentage of each star
# rating for the local authority.
class Ratings_Service
	include Star_Values

	def initialize rating_xml
		@rating_xml = Nokogiri::XML(rating_xml)
	end

	def parse_ratings
		@hygiene_ratings = @rating_xml.css("RatingValue") 
		@total_establishments = @rating_xml.css("ItemCount").children.text.to_f
		if (@total_establishments.nil? || @total_establishments == 0)
			return {}
		end
		parse_into_percentages
	end

private
	def parse_into_percentages
 		rating_by_percentages = []
 		tallied_values = tally_by_rating

		STAR_MAP.keys.each do |star|
			count = tallied_values[star]
			rating_by_percentages << Rating.new(STAR_MAP[star], calculate_percentage(count))
		end

		rating_by_percentages
	end

	def tally_by_rating 
		tally = {}
		@hygiene_ratings.each do |rating|
			star_value = rating.children.text
			tally[star_value] = increment_counter(tally[star_value])
		end
		tally
	end

	def increment_counter counter
		new_counter = 1
		unless counter.nil? 
			new_counter = counter + 1
		end
		new_counter
	end

	def calculate_percentage count
		percentage = '0%'
		unless count.nil? 
			fraction = (count.to_f/@total_establishments).round(2) * 100
			percentage = "#{fraction.to_i}%"
		end
		percentage
	end

end