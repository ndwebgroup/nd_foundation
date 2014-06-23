# ND::Foundation

This adds a Notre Dame themed Foundation stylesheet to your Rails asset pipeline.

## Installation

In your Gemfile:

    gem 'foundation-rails'
    gem 'nd_foundation'

In your application.css.scss:

    // Your settings here...
    $department: ooit;
    // This will automatically pull in foundation.css.scss
    @import 'nd_foundation';

