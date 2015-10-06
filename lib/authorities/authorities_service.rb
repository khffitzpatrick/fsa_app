require 'json'
require_relative 'authority'

class Authorities_Service

	attr_accessor :authorities_json

	def initialize authorities_json
		@authorities_json = authorities_json
	end

	def parse_authorities 
		#Struggling to think of a better naming convention to distinguish an fsa authority
		# object from the stripped-down object this will create
		parsed_authorities = []
		fsa_authorities_hash = JSON.parse(@authorities_json)
		fsa_authorities_array = fsa_authorities_hash['authorities']
		fsa_authorities_array.each do |fsa_authority|
			parsed_authorities << Authority.new(fsa_authority['Name'], fsa_authority['LocalAuthorityId'])
		end
		parsed_authorities
	end

end