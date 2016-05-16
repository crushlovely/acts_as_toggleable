# Acts As Toggleable

[![RubyGem Version](http://img.shields.io/gem/v/acts_as_toggleable.svg?style=flat)](https://rubygems.org/gems/acts_as_toggleable)
[![Dependency Status](http://img.shields.io/gemnasium/crushlovely/acts_as_toggleable.svg?style=flat)](https://gemnasium.com/crushlovely/acts_as_toggleable)
[![Build Status](http://img.shields.io/travis/crushlovely/acts_as_toggleable.svg?style=flat)](https://travis-ci.org/crushlovely/acts_as_toggleable)
[![Code Climate](http://img.shields.io/codeclimate/github/crushlovely/acts_as_toggleable.svg?style=flat)](https://codeclimate.com/github/crushlovely/acts_as_toggleable)
[![Code Coverage](http://img.shields.io/codeclimate/coverage/github/crushlovely/acts_as_toggleable.svg?style=flat)](https://codeclimate.com/github/crushlovely/acts_as_toggleable)

Create toggleable attributes for your ActiveRecord models.

## Why?

We frequently require the ability to toggle the visibility of content on an application's front-end.

## Installation

`gem install acts_as_toggleable`

or in your `Gemfile`

``` ruby
gem 'acts_as_toggleable'
```

## Usage

Make sure you require the library.

``` ruby
require 'acts_as_toggleable'
```

This gem follows a similar API to many ActiveRecord plugins:

``` ruby
class Widget < ActiveRecord::Base
  acts_as_toggleable :visible
  # acts_as_toggleable :visible, :default => false
end
```

This sets up a boolean field on the model, and also makes the following instance methods available:

``` ruby
widget = Widget.new
widget.visible
# => true

# toggle the widget's visibility, but don't persist the change
widget.toggle(:visible)
widget.visible
# => false

# toggle the widget's visibility and persist the change
widget.toggle!(:visible)
```

### Options

In addition to the name of the attribute to create, you can also pass the following options:

* `:scope_name`: The Symbol representing the name of the positive scope (optional, default: toggleable_attribute).
* `:inverse_scope_name`: The Symbol representing the name of the negative scope (optional, default: "not_#{toggleable_attribute}").

### Scopes

Two scopes are automatically created when you define a toggleable attribute:

``` ruby
class Widget < ActiveRecord::Base
  acts_as_toggleable :visible
end

widget1 = Widget.create(:visible => true)
widget2 = Widget.create(:visible => false)

Widget.visible
# => [widget1]

Widget.not_visible
# => [widget2]
```

These are just plain old ActiveRecord scopes, so you can chain them together with other scopes as needed:

``` ruby
Widget.visible.where(:created_at.lte => 10.days.ago)
```

You can also customize the names of the scope created:

``` ruby
class Widget < ActiveRecord::Base
  acts_as_toggleable :published, :inverse_scope_name => :unpublished
end

Widget.published
Widget.unpublished
```

## Contributing to acts_as_toggleable

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so we don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so we can cherry-pick around it.

## Copyright

Copyright (c) 2016 PJ Kelly (Crush & Lovely). See LICENSE for further details.
