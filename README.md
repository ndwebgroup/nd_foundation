# ND::Foundation

This adds a Notre Dame themed Foundation stylesheet to your Rails asset pipeline. Additionaly this gem includes a generator to build a layout file you can use that implements a basic ND layout using the Foundation framework.

## Installation

In your Gemfile:

    gem 'foundation-rails'
    gem 'nd_foundation', git: 'https://github.com/ndwebgroup/nd_foundation'

*Note: This gem will require sass-rails 5.0.0 to work with the latest version of Foundation.*

## Generating the Layout

Once you have run bundle install, you have access to the generator.

To add a ND themed layout file, run:

    rails g nd:foundation:install

or run it while adding your department code:

    rails g nd:foundation:install ooit

This will do the following:

* create a *nd.html.erb* layout file in the layouts folder
* create a *_nd_footer.html.erb* partial in the layouts folder
* create a *_nd_header.html.erb* partial in the layouts folder
* add a rule to the *assets.rb* initializer allowing you to precomplile the assets in the vendor directory
* add an *overrides* stylesheet in the *app/assets/stylesheets* directory
* add the require directives to *application.css* to include both the *nd_foundations* and *overrides* stylesheets
* if you pass in a department, it will use that to select the correct brand bar image

## Altering the Layout

Once you have run the generator the first change you need to make is to add

    layout 'nd'

at the top of any controllers that need to inherit the new layout.

After that, you will want to open both the header and footer partials and update any content that is specific to your department
like address, department name, links, phone, etc.

Enjoy!
