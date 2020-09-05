# CHANGELOG

## 0.0.4.alpha

redefine models in order to follow changed APIs below.

- LocalAccount was merged into Account.
- Caligraph APIs were removed.

## 0.0.3.alpha

- support APIs below.
  - GET `/v1/{accountId}/bookings`
  - GET `/v1/{accountId}/profiles/{profileId}/bookings`
  - GET `/v1/{accountId}/profiles/{profileId}/bookings/{bookingId}`

## 0.0.2.alpha

- support APIs below.
  - GET `/v1/{accountId}/profiles`
  - GET `/v1/{accountId}/profiles/{profileId}`

## 0.0.1.alpha

- Initial release.
- support APIs below.
  - GET `/v1/{accountId}`
  - GET `/v1/subdomains/{subdomain}`
  - GET `/v1/suggestedsubdomains`
