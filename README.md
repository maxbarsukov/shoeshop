[![Build Status](https://travis-ci.com/maxbarsukov/shoeshop.svg?branch=master)](https://travis-ci.com/maxbarsukov/shoeshop)
[![Coverage Status](https://coveralls.io/repos/github/maxbarsukov/shoeshop/badge.svg?branch=master)](https://coveralls.io/github/maxbarsukov/shoeshop?branch=master)
[![Security](https://hakiri.io/github/maxbarsukov/shoeshop/master.svg)](https://hakiri.io/github/maxbarsukov/shoeshop/master)
[![GuardRails badge](https://api.guardrails.io/v2/badges/maxbarsukov/shoeshop.svg?token=3d5892fecca01ce92b8bbc383010c005ccba7ec101cd480c093c8bcfb9b131cf&provider=github)](https://dashboard.guardrails.io/gh/maxbarsukov/82085)
[![Dependabot](https://img.shields.io/badge/dependabot-enabled-success.svg)](https://dependabot.com)

# ShoeShop

> A simple yet fully functional web-shop application built with Ruby on Rails

This app is a store with features close to the real ones.

The user can add products to the cart and buy, navigate by categories and brands, search, filter and sort products.
The administrator is able to manage products, add and change them, and also has access to the API and the administrator page.

You can go to the [website](https://shoeeshop.herokuapp.com/) or view the images in the [docs/images](https://github.com/maxbarsukov/shoeshop/tree/master/docs/images) folder

## Functionality included

- Sign up / sign in / forgot password
- Sign in with Facebook
- Filter products by categories and brands
- Add products to the shopping cart
- Search for products using auto-completion
- View related and recent products
- Product's pagination
- Use app's API if the administrator has given you UID and secret
- Admin Page
- OAuth 2 provider

## About the code

- Built with `Ruby on Rails 5`
- Using `Boostrap 3` and own stylesheets for styles
- `Devise` as authentication solution
- `Pundit` for authorization
- `Pagy` for pagination
- `rails_admin` for admin page
- `HAML` as templating engine for HTML
- `CoffeeScript` instead of JS in scripts
- Using `jQuery` and plugins: `easydropdown`, `responsiveslides`, `simpleCart`, `typeahead`, etc.
- `meta-tags` for SEO optimization
- `OmniAuth` provides authentication using third-party credentials
- `Doorkeeper` as `OAuth 2` provider and `API` authenticator
- `API` built with `jbuilder` and `active_model_serializers`
- `acts-as-taggable-on` for filtering products by tags
- `rack-attack` as middleware for throttling and blocking abusive requests
- TDD with `RSpec` + `ShouldaMatchers` + `FactoryBot` + `etc.` (over `110` tests)
- Profiling and optimization tools:
  - `Bullet` as `N+1` problem profiler
  - `active_record_doctor` helps to keep the database in a good shape
- Code quality scanners: `rails_best_practices`, `rubocop`, `rubycritic`, `brakeman`
- CI/CD
  - `Travis CI`
  - `Coveralls.io` for test coverage history & statistics
  - `Hakiri.io` & `GuardRails.io` as security vulnerabilities scanner
- `Docker` & `docker-compose`

## Setup

Clone this repository:

`git clone git@github.com:maxbarsukov/shoeshop.git`

Install gems:

`bundle install`

Setup database and seeds:

`bundle exec rails db:create db:migrate db:seed`

Setup your test database:

`bundle exec rails db:test:prepare`

## Run

With Foreman:
- Dev:
    `foreman start`
- Production:
    `foreman start -f Procfile`

Using Docker: `docker-compose up`

## Testing

Run tests with `rspec`

Check security vulnerability with `bundle exec brakeman --exit-on-warn -f plain -5`

Check the quality of code with `bundle exec rails_best_practices . --spec -c config/rails_best_practices.yml`

Run `bundle exec rubycritic` for code quality reporter

## License

MIT License. Copyright 2021 nyapsilon
