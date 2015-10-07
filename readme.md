# FSA_APP

This app is written in [Rack](https://github.com/rack/rack), a modular Ruby webserver interface.

In order to run the app, you will need to run:

`rackup lib/fsa_app.ru`

from within the directory structure.
This will log out a port, from which you can connect with the app in your browser, e.g. 

http://localhost:9292/

## Developer installation

You will need [RVM](https://rvm.io/rvm/install) installed.
To easily install all of the project's dependencies, install [Bundler](http://bundler.io/) by running the following in terminal:

`gem install bundler`

Then within the project directory, run:

`bundle install`


## Running the tests using Rake

Ensure you are in the fsa_app directory in a terminal window.

Run rake -T to see the rake tasks available:

``rake test:all         # Run all the tests and print out documentation``

``rake test:features    # Run Cucumber features``

``rake test:rspec       # Run Rspec tests with documentation``

``rake test:rspec_nyan  # Run Rspec tests with NyanCat``


## Assumptions and Limitations

This app assumes that the JSON and XML returned from the FSA api has no errors and is in the expected format.

Limitations:

-There is no error handling when the user selects the default drop-down option.

-There is no 'return' function on the results page.
