require 'erb'

module Template_Library
	INDEX = 'index.html.erb'
	ERROR = 'error.html.erb'
	RESULTS = 'results.html.erb'

	def render_template template
		path = File.expand_path("views/#{template}")
		ERB.new(File.read(path)).result(binding)
	end
end