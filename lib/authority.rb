class Authority

	attr_accessor :name, :id

	def initialize name, id
		@name = name
		@id = id
	end

	#I can't decide whether this is really clever or really dirty just to satisfy 
	# authorities_service_spec.rb
	# Pros: It is a legitimate comparison for this object in its current conception.
	# Cons: makes the code slightly less maintainable and harder to extend - extra thing to
	#  think about if this object needs to be changed. 
	def == other_authority
		@name == other_authority.name && @id == other_authority.id
	end

end
