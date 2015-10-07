require_relative 'index_app'
require_relative 'results_app'

map '/' do
  run Index_App.new
end

map '/get_results' do
  run Results_App.new
end