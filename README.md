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
  fc.font_name = 'icons'
  fc.source_dir = 'source/icons'
  fc.fonts_dir = 'fonts'
  fc.css_dir = 'stylesheets/components'
  fc.templates = 'scss'
end
```

Put your icon files(just like svg) into `source_dir`, then run `middleman server`.

If `source_dir` has been changed, webfont files and stylesheets will be generated automatically.

## License

Copyright (C) 2014 Yasuaki Uechi. see LICENSE.md for further details.
