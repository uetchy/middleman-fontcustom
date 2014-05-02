# middleman-fontcustom

[![Gem Version](https://badge.fury.io/rb/middleman-fontcustom.svg)](http://badge.fury.io/rb/middleman-fontcustom)
[![Dependency Status](https://gemnasium.com/oame/middleman-fontcustom.svg)](https://gemnasium.com/oame/middleman-fontcustom)

middleman-fontcustom is an extension that provides webfont generator for the Middleman.

## Installation

Add `gem "middleman-fontcustom"` into your `Gemfile` and run `bundle install`

## Configure

```ruby
activate :fontcustom
```

Following lines are default options of this extension.

```ruby
activate :fontcustom do |fc|
  fc.font_name = 'fontcustom'
  fc.source_dir = 'assets/icons'
  fc.fonts_dir = 'source/fonts'
  fc.css_dir = 'source/stylesheets'
  fc.templates = 'scss'
  # fc.templates = 'scss-rails scss css'
  fc.no_hash = false
end
```

Put your icon files(just like svg) into `source_dir`, then run `middleman server`.

If `source_dir` has been changed, webfont files and stylesheets will be generated automatically.

## License

Copyright (C) 2014 Ryo Ameya. see LICENSE.md for further details.
