# FSA_APP

rackup lib/fsa_app.ru


##

###

## Running the tests using rake

Ensure you are in the fsa_app directory in a console window.

Run rake -T to see the rake tasks available:

rake test:all         # Run all the tests and print out documentation
rake test:features    # Run Cucumber features
rake test:rspec       # Run Rspec tests with documentation
rake test:rspec_nyan  # Run Rspec tests with NyanCat



### Assumptions

In the Hygiene_Mapping module I have made assumptions based on the descriptions
of the scores, e.g. that 'Very Good',0 equates to a 5-star rating.

Challenge connecting to the FSA api, 