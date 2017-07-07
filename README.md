# Gargoyle

super simple authentication

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gargoyle'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gargoyle

## Feature

- Rails helper method
- Session authenticate scope
- Rails routes helper
- Password management

## Usage

### Rails helper method

include `Gargoyle::ControllerHelpers` to `ApplicationController` in Rails.

```ruby
class ApplicationController < ActionController::Base
  include Gargoyle::ControllerHelpers
  before_action :authenticate_user!

  private

  # template method pattern.
  # set session scope name
  def auth_scope
    :user
  end

  # template method pattern
  def no_signin_redirect_logic
    -> { redirect_to root_path }
  end
end
```

When set before action `authenticate_user!`, if user don't sign in, run `no_signin_redirect_logic.call`.

#### Controller Additions

Gargoyle provides the following controller methods:

- auth_scope
- no_signin_redirect_logic

These helpers:

- current_user
- signed_in?

provide the following private methods (template method pattern):

- auth_scope
- no_signin_redirect_logic

### Rails routes helper

To authorize users in `config/routes.rb`:

```ruby
require 'gargoyle/constraints/signed_in'
require 'gargoyle/constraints/signed_out'

Rails.application.routes.draw do
  root 'sessions#new', constraints: Gargoyle::Constraits::SignedOut.new(:user)
  root 'dashboards#show', as: :signed_in_root, constraints: Gargoyle::Constraits::SignedIn.new(:user)
end
```

### Password management

password hashing method (using BCrypt):

```ruby
Gargoyle::Password.hashing(password)
```

password conmpare method:

```ruby
Gargoyle::Password.compare?(hashed_password, unhashed_password)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kbaba1001/gargoyle. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
