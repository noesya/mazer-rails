# Mazer on Rails

[![Gem Version](https://badge.fury.io/rb/mazer-rails.svg)](https://badge.fury.io/rb/mazer-rails)

Easily integrate [Mazer admin theme](https://github.com/zuramai/mazer) in a Ruby on Rails app.

**Current theme version**: 2.0.3

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add mazer-rails

## Usage

Import Mazer styles in `app/assets/stylesheets/application.scss`:

```scss
@import "mazer/app";
@import "mazer/app-dark";
```

Add Mazer to your `application.js`:

```js
//= require mazer/initTheme
//= require mazer/bootstrap
//= require mazer/app
```

## Development

Following theses examples:
- https://github.com/pelted/coreui-rails
- https://github.com/twbs/bootstrap-rubygem

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Upgrading assets

- Fork & clone this repository
- Run `bundle install` to install dependencies
- Run `bundle exec rake update` to retrieve assets from latest release
- Commit and push your changes to your fork repository
- Open a pull request ✨

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/noesya/mazer-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/noesya/mazer-rails/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mazer::Rails project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/noesya/mazer-rails/blob/main/CODE_OF_CONDUCT.md).
