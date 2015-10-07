class Authority

	attr_accessor :name, :id, :filename

	def initialize name, id, filename=nil
		@name = name
		@id = id
		@filename = filename
	end

	#I can't decide whether this is clever or really dirty just to satisfy 
	# authorities_service_spec.rb
	# Pros: It is a legitimate comparison for this object in its current conception.
	# Cons: makes the code slightly less maintainable and harder to extend - extra thing to
	#       think about if this object needs to be changed. 
	def == other_authority
		same_name_and_id = @name == other_authority.name && @id == other_authority.id
		unless (@filename.nil? && other_authority.filename.nil?)
			return same_name_and_id && @filename == other_authority.filename
		end
		same_name_and_id
	end

end
