# YouCanBook.me API Client

[![Test](https://github.com/koshilife/youcanbookme-api-ruby-client/workflows/Test/badge.svg)](https://github.com/koshilife/youcanbookme-api-ruby-client/actions?query=workflow%3ATest)
[![codecov](https://codecov.io/gh/koshilife/youcanbookme-api-ruby-client/branch/master/graph/badge.svg)](https://codecov.io/gh/koshilife/youcanbookme-api-ruby-client)
[![Gem Version](https://badge.fury.io/rb/youcanbookme.svg)](http://badge.fury.io/rb/youcanbookme)
[![license](https://img.shields.io/github/license/koshilife/youcanbookme-api-ruby-client)](https://github.com/koshilife/youcanbookme-api-ruby-client/blob/master/LICENSE.txt)

## About

These client libraries are created for [YouCanBook.me API](https://api.youcanbook.me/docs/index.html).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'youcanbookme'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install youcanbookme

## Supported statuses each YouCanBook.me API

- Account:
  - [ ] POST `/v1/`
  - [x] GET `/v1/{accountId}`
  - [ ] PATCH `/v1/{accountId}`
  - [ ] DELETE `/v1/{accountId}`
- Appointment Types:
  - [ ] POST `/v1/{accountId}/profiles/{profileId}/appointmenttypes/items`
  - [ ] PATCH `/v1/{accountId}/profiles/{profileId}/appointmenttypes/items/{appointmentTypeId}`
  - [ ] DELETE `/v1/{accountId}/profiles/{profileId}/appointmenttypes/items/{appointmentTypeId}`
- Bookings:
  - [ ] GET `/v1/{accountId}/bookings`
  - [ ] GET `/v1/{accountId}/firedactions`
  - [ ] GET `/v1/{accountId}/profiles/{profileId}/bookings`
  - [ ] POST `/v1/{accountId}/profiles/{profileId}/bookings`
  - [ ] GET `/v1/{accountId}/profiles/{profileId}/bookings/{bookingId}`
  - [ ] PATCH `/v1/{accountId}/profiles/{profileId}/bookings/{bookingId}`
  - [ ] DELETE `/v1/{accountId}/profiles/{profileId}/bookings/{bookingId}`
  - [ ] GET `/v1/{accountId}/profiles/{profileId}/firedactions`
  - [ ] GET `/v1/ics/{bookingSecret}/{bookingIdOrRef}.ics`
  - [ ] GET `/v1/profiles/{profileIdOrSubdomain}/bookings/{bookingIdOrRef}/lobby`
  - [ ] (Deprecated) GET `/v1/ics/{bookingRef}`
  - [ ] (Deprecated) GET `/v1/ics/{bookingRef}.ics`
- Calendars:
  - [ ] GET `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}/calendars`
  - [ ] POST `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}/calendars`
  - [ ] GET `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}/calendars/{calendarId}`
  - [ ] PUT `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}/calendars/{calendarId}`
  - [ ] PATCH `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}/calendars/{calendarId}`
  - [ ] DELETE `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}/calendars/{calendarId}`
- Events:
  - [ ] POST `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}/calendars/{calendarId}/events`
  - [ ] GET `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}/calendars/{calendarId}/events/{eventId}`
  - [ ] DELETE `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}/calendars/{calendarId}/events/{eventId}`
- Profile
  - [ ] GET `/v1/{accountId}/profiles`
  - [ ] POST `/v1/{accountId}/profiles`
  - [ ] GET `/v1/{accountId}/profiles/{profileId}`
  - [ ] PATCH `/v1/{accountId}/profiles/{profileId}`
  - [ ] DELETE `/v1/{accountId}/profiles/{profileId}`
  - [x] GET `/v1/subdomains/{subdomain}`
  - [x] GET `/v1/suggestedsubdomains`
- Query
  - [ ] POST `/v1/{localAccountId}/queries`
- Remote Account
  - [ ] GET `/v1/{localAccountId}/remoteaccounts`
  - [ ] POST `/v1/{localAccountId}/remoteaccounts`
  - [ ] GET `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}`
  - [ ] PATCH `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}`
  - [ ] DELETE `/v1/{localAccountId}/remoteaccounts/{remoteAccountId}`
- Team Members:
  - [ ] POST `/v1/{accountId}/profiles/{profileId}/teammembers/items`
  - [ ] PATCH `/v1/{accountId}/profiles/{profileId}/teammembers/items/{teamMemberId}`
  - [ ] DELETE `/v1/{accountId}/profiles/{profileId}/teammembers/items/{teamMemberId}`

## Usage

The APIs client needs account email and password(or token).
This client setup step is below.

```ruby
# set token by YouCanBookMe.configure methods.
YouCanBookMe.configure do |config|
  config.username          = 'foobar@example.com'
  config.password_or_token = '<PASSWORD_OR_TOKEN>'
end
client = YouCanBookMe::Client.new

# set token by YouCanBookMe::Client initializer.
username          = 'foobar@example.com'
password_or_token = '<PASSWORD_OR_TOKEN>'
client = YouCanBookMe::Client.new username, password_or_token
```

This client basic usage is below.

```ruby
TODO
```

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/koshilife/youcanbookme-api-ruby-client). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the youcanbookme Api Client project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/koshilife/youcanbookme-api-ruby-client/blob/master/CODE_OF_CONDUCT.md).
