# frozen_string_literal: true

module AssertHelper
  def assert_account001(acc)
    assert_equal 'ACC001', acc.id
    assert_equal 'foobar@example.com', acc.email
    assert_equal 0, acc.smsCredits
  end

  def assert_account001_many_fields(acc)
    assert_account001(acc)
    assert_equal '2020-08-01T13:00:00Z', acc.createdAt
    assert_equal 'Bar', acc.familyName
    assert_equal 'Foo', acc.givenName
    assert_equal true, acc.gridBranding
    assert_equal 'FooBar.org', acc.organisation
    assert_equal 'ja', acc.locale
    assert_equal 'UTC', acc.timeZone
    assert_equal 'Developer', acc.tags
    assert_equal 'foobar.zoom@example.com', acc.zoomEmailAddress
    assert_equal true, acc.contactHigh
    assert_equal true, acc.contactLow
    assert_equal 730, acc.deleteBookingsAfterDays
    assert_equal '{"featureFlags":{"diagnostics":true},"oneOff":{"TERMS":true,"HIDE_BOOKING_LINK":true},"profileFolders":{}}', acc.clientState
    assert acc.profiles.is_a? Array
    assert acc.children.is_a? Array
    assert acc.warnings.is_a? Array
    assert_equal 'UPLOAD_CODE001', acc.uploadCode
    assert_equal true, acc.hasBookings
    assert_equal 'REALTIME_TOPIC_001', acc.realtimeTopic
    assert_equal true, acc.terms
  end

  def assert_account001_profiles_fields(acc)
    proc_assert_profile = proc do |profile, expected_id|
      assert_equal expected_id, profile.id
      actions = profile.actions
      action = actions[0]
      assert_equal 'EMAIL', action.type
      assert_equal 'BOOKING_CANCELLED_BY_BOOKER', action.anchor
      assert_equal 'Cancellation email to you', action.title
      action = actions[1]
      assert_equal 'EMAIL', action.type
      assert_equal 'BOOKING_RESCHEDULED_BY_OWNER', action.anchor
      assert_equal 'Reschedule email to booker', action.title
      action = actions[2]
      assert_equal 'EMAIL', action.type
      assert_equal 'BOOKING_CREATED', action.anchor
      assert_equal 'Confirmation email to booker', action.title
      action = actions[3]
      assert_equal 'EMAIL', action.type
      assert_equal 'BOOKING_CANCELLED_BY_OWNER', action.anchor
      assert_equal 'Cancellation email to booker', action.title
      action = actions[4]
      assert_equal 'EMAIL', action.type
      assert_equal 'BOOKING_CREATED', action.anchor
      assert_equal 'Confirmation email to you', action.title
      action = actions[5]
      assert_equal 'EMAIL', action.type
      assert_equal 'BOOKING_RESCHEDULED_BY_BOOKER', action.anchor
      assert_equal 'Reschedule email to you', action.title
      action = actions[6]
      assert_equal 'EMAIL', action.type
      assert_equal 'BOOKING_STARTS', action.anchor
      assert_equal 'Reminder email to booker', action.title
      action = actions[7]
      assert_equal 'EMAIL', action.type
      assert_equal 'BOOKING_CREATED', action.anchor
      assert_equal 'Confirmation email to Team Member', action.title
    end
    assert_equal 'ACC001', acc.id
    assert_equal 3, acc.profiles.length
    proc_assert_profile.call(acc.profiles[0], 'PRO001')
    proc_assert_profile.call(acc.profiles[1], 'PRO002')
    proc_assert_profile.call(acc.profiles[2], 'PRO003')
  end

  def assert_booking_p001b001(book)
    assert_equal 'PRO001_BOOK001', book.id
    assert_equal 'PRO001 BOOK001 TITLE', book.title
    assert_equal 'ACC001', book.accountId
    assert_equal 'PRO001', book.profileId
    assert_equal '2020-08-31T11:30:00Z', book.createdAt
    assert_equal '2020-09-04T10:00:00', book.startsAt
    assert_equal '2020-09-04T11:00:00', book.endsAt
    assert_equal 'NOT_USED', book.tentative
    assert_equal 'Asia/Tokyo', book.timeZone
    assert_equal false, book.cancelled
  end

  def assert_booking_p001b001_many_fields(book)
    assert_booking_p001b001(book)
    assert_equal 'https://api.youcanbook.me/v1/ACC001/remoteaccounts/REMOTE001/calendars/foobar%40example.com/events/EV001', book.remoteId
    assert_equal 'en_US', book.locale
    assert_equal '', book.cancellationReason
    assert_equal 'REF_PRO001_BOOK001', book.ref
    assert_equal 1, book.units
    assert_equal '100.101.102.103', book.ip
    assert_equal 0, book.price
    assert_equal 'USD', book.currency
    assert_equal 0, book.appointmentTypes.length
    assert_equal '', book.linkFields
    assert_equal 4, book.answers.length
    assert_equal 3, book.actions.length
    assert !book.lobby.nil?
    assert_equal false, book.preview
    assert_equal 'OWNER_SECRET_001', book.ownerSecret
    assert_equal 'LOBBY_PASSWORD_001', book.lobbyPassword
    assert_equal 'en_US', book.displayLocale
    assert_equal 'Asia/Tokyo', book.displayTimeZone
    assert_equal '2020-09-04T01:00:00Z', book.startsAtUTC
    assert_equal 100, book.currencyFactor
    assert_equal '2020-09-04T02:00:00Z', book.endsAtUTC
    assert !book.startRescheduledFromUTC.nil?
    assert_equal '1H', book.displayDurationShort
    assert_equal 'USD 0.00', book.displayPrice
    assert_equal '1 hour', book.displayDurationFull
    assert_equal 60, book.durationMinutes
    assert_equal 0, book.services.length
    assert_equal 'future', book.timeline
    assert book.cancellable
    assert_equal false, book.cancelReasonRequired
    assert_equal '8/31/20 11:30 PM', book.displayCreatedAtShortShort
    assert_equal 'Friday, September 4, 2020 10:00 AM (1 hour)', book.displayStartsAtFullShortAndDurationFull
    assert_equal 'Sep 4, 2020 10:00 AM', book.displayStartsAtMediumShort
    assert_equal 'Sep 4, 2020 11:00 AM', book.displayEndsAtMediumShort
    assert_equal 'Sep 4, 2020 10:00 AM', book.displayBookerStartsAtMediumShort
    assert_equal 'Sep 4, 2020 11:00 AM', book.displayBookerEndsAtMediumShort
    assert_equal 'Aug 31, 2020 11:30:00 PM', book.displayCreatedAtMedium
  end

  def assert_booking_p001b002(book)
    assert_equal 'PRO001_BOOK002', book.id
    assert_equal 'PRO001 BOOK002 TITLE', book.title
    assert_equal 'ACC001', book.accountId
    assert_equal 'PRO001', book.profileId
    assert_equal '2020-08-31T12:00:00Z', book.createdAt
    assert_equal '2020-09-04T13:00:00', book.startsAt
    assert_equal '2020-09-04T14:00:00', book.endsAt
    assert_equal 'NOT_USED', book.tentative
    assert_equal 'Asia/Tokyo', book.timeZone
    assert_equal false, book.cancelled
  end

  def assert_booking_p001b002_many_fields(book)
    assert_booking_p001b002(book)
    assert_equal 'https://api.youcanbook.me/v1/ACC001/remoteaccounts/REMOTE001/calendars/foobar%40example.com/events/EV002', book.remoteId
    assert_equal 'en_US', book.locale
    assert_equal '', book.cancellationReason
    assert_equal 'REF_PRO001_BOOK002', book.ref
    assert_equal 1, book.units
    assert_equal '100.101.102.103', book.ip
    assert_equal 0, book.price
    assert_equal 'USD', book.currency
    assert_equal 0, book.appointmentTypes.length
    assert_equal '', book.linkFields
    assert_equal 4, book.answers.length
    assert_nil book.actions
    assert_nil book.lobby
    assert_equal false, book.preview
    assert_equal 'OWNER_SECRET_002', book.ownerSecret
    assert_equal 'LOBBY_PASSWORD_002', book.lobbyPassword
    assert_equal 'en_US', book.displayLocale
    assert_equal 'Asia/Tokyo', book.displayTimeZone
    assert_equal '2020-09-04T04:00:00Z', book.startsAtUTC
    assert_equal 100, book.currencyFactor
    assert_equal '2020-09-04T05:00:00Z', book.endsAtUTC
    assert !book.startRescheduledFromUTC.nil?
    assert_equal '1H', book.displayDurationShort
    assert_equal 'USD 0.00', book.displayPrice
    assert_equal '1 hour', book.displayDurationFull
    assert_equal 60, book.durationMinutes
    assert_equal 0, book.services.length
    assert_equal 'future', book.timeline
    assert book.cancellable
    assert_equal false, book.cancelReasonRequired
    assert_equal '8/31/20 11:30 PM', book.displayCreatedAtShortShort
    assert_equal 'Friday, September 4, 2020 1:00 PM (1 hour)', book.displayStartsAtFullShortAndDurationFull
    assert_equal 'Sep 4, 2020 1:00 PM', book.displayStartsAtMediumShort
    assert_equal 'Sep 4, 2020 2:00 PM', book.displayEndsAtMediumShort
    assert_equal 'Sep 4, 2020 1:00 PM', book.displayBookerStartsAtMediumShort
    assert_equal 'Sep 4, 2020 2:00 PM', book.displayBookerEndsAtMediumShort
    assert_equal 'Aug 31, 2020 11:30:00 PM', book.displayCreatedAtMedium
  end

  def assert_booking_p001b003(book)
    assert_equal 'PRO001_BOOK003', book.id
    assert_equal 'PRO001 BOOK003 TITLE', book.title
    assert_equal 'ACC001', book.accountId
    assert_equal 'PRO001', book.profileId
    assert_equal '2020-09-02T13:00:00Z', book.createdAt
    assert_equal '2020-09-14T09:00:00', book.startsAt
    assert_equal '2020-09-14T10:00:00', book.endsAt
    assert_equal 'NOT_USED', book.tentative
    assert_equal 'Asia/Tokyo', book.timeZone
    assert_equal false, book.cancelled
  end

  def assert_booking_p001b003_many_fields(book)
    assert_booking_p001b003(book)
    assert_equal 'https://api.youcanbook.me/v1/ACC001/remoteaccounts/REMOTE001/calendars/foobar%40example.com/events/EV003', book.remoteId
    assert_equal 'en_US', book.locale
    assert_equal '', book.cancellationReason
    assert_equal 'REF_PRO001_BOOK003', book.ref
    assert_equal 1, book.units
    assert_equal '100.101.102.103', book.ip
    assert_equal 0, book.price
    assert_equal 'USD', book.currency
    assert_equal 0, book.appointmentTypes.length
    assert_equal '', book.linkFields
    assert_equal 4, book.answers.length
    assert_nil book.actions
    assert_nil book.lobby
    assert_equal false, book.preview
    assert_equal 'OWNER_SECRET_003', book.ownerSecret
    assert_equal 'LOBBY_PASSWORD_003', book.lobbyPassword
    assert_equal 'en_US', book.displayLocale
    assert_equal 'Asia/Tokyo', book.displayTimeZone
    assert_equal '2020-09-14T00:00:00Z', book.startsAtUTC
    assert_equal 100, book.currencyFactor
    assert_equal '2020-09-14T01:00:00Z', book.endsAtUTC
    assert !book.startRescheduledFromUTC.nil?
    assert_equal '1H', book.displayDurationShort
    assert_equal 'USD 0.00', book.displayPrice
    assert_equal '1 hour', book.displayDurationFull
    assert_equal 60, book.durationMinutes
    assert_equal 0, book.services.length
    assert_equal 'future', book.timeline
    assert book.cancellable
    assert_equal false, book.cancelReasonRequired
    assert_equal '9/2/20 1:00 PM', book.displayCreatedAtShortShort
    assert_equal 'Monday, September 14, 2020 9:00 AM (1 hour)', book.displayStartsAtFullShortAndDurationFull
    assert_equal 'Sep 14, 2020 9:00 AM', book.displayStartsAtMediumShort
    assert_equal 'Sep 14, 2020 10:00 AM', book.displayEndsAtMediumShort
    assert_equal 'Sep 14, 2020 9:00 AM', book.displayBookerStartsAtMediumShort
    assert_equal 'Sep 14, 2020 10:00 AM', book.displayBookerEndsAtMediumShort
    assert_equal 'Sep 2, 2020 01:00:00 PM', book.displayCreatedAtMedium
  end

  def assert_booking_p002b001(book)
    assert_equal 'PRO002_BOOK001', book.id
    assert_equal 'PRO002 BOOK001 TITLE', book.title
    assert_equal 'ACC001', book.accountId
    assert_equal 'PRO002', book.profileId
    assert_equal '2020-09-02T15:00:00Z', book.createdAt
    assert_equal '2020-09-15T10:00:00', book.startsAt
    assert_equal '2020-09-15T12:00:00', book.endsAt
    assert_equal 'NOT_USED', book.tentative
    assert_equal 'Asia/Tokyo', book.timeZone
    assert_equal false, book.cancelled
  end

  def assert_booking_p002b001_many_fields(book)
    assert_booking_p002b001(book)
    assert_equal 'https://api.youcanbook.me/v1/ACC001/remoteaccounts/REMOTE002/calendars/foobar%40example.com/events/EV001', book.remoteId
    assert_equal 'en_US', book.locale
    assert_equal '', book.cancellationReason
    assert_equal 'REF_PRO002_BOOK001', book.ref
    assert_equal 1, book.units
    assert_equal '100.101.102.103', book.ip
    assert_equal 0, book.price
    assert_equal 'USD', book.currency
    assert_equal 0, book.appointmentTypes.length
    assert_equal '', book.linkFields
    assert_equal 3, book.answers.length
    assert_nil book.actions
    assert_nil book.lobby
    assert_equal false, book.preview
    assert_equal 'OWNER_SECRET_001', book.ownerSecret
    assert_equal 'LOBBY_PASSWORD_001', book.lobbyPassword
    assert_equal 'en_US', book.displayLocale
    assert_equal 'Asia/Tokyo', book.displayTimeZone
    assert_equal '2020-09-15T01:00:00Z', book.startsAtUTC
    assert_equal 100, book.currencyFactor
    assert_equal '2020-09-15T03:00:00Z', book.endsAtUTC
    assert !book.startRescheduledFromUTC.nil?
    assert_equal '2H', book.displayDurationShort
    assert_equal 'USD 0.00', book.displayPrice
    assert_equal '2 hours', book.displayDurationFull
    assert_equal 120, book.durationMinutes
    assert_equal 0, book.services.length
    assert_equal 'future', book.timeline
    assert book.cancellable
    assert_equal false, book.cancelReasonRequired
    assert_equal '9/2/20 3:00 PM', book.displayCreatedAtShortShort
    assert_equal 'Tuesday, September 15, 2020 10:00 AM (2 hours)', book.displayStartsAtFullShortAndDurationFull
    assert_equal 'Sep 15, 2020 10:00 AM', book.displayStartsAtMediumShort
    assert_equal 'Sep 15, 2020 12:00 PM', book.displayEndsAtMediumShort
    assert_equal 'Sep 15, 2020 10:00 AM', book.displayBookerStartsAtMediumShort
    assert_equal 'Sep 15, 2020 12:00 PM', book.displayBookerEndsAtMediumShort
    assert_equal 'Sep 2, 2020 03:00:00 PM', book.displayCreatedAtMedium
  end

  def assert_booking_p003b001(book)
    assert_equal 'PRO003_BOOK001', book.id
    assert_equal 'PRO003 BOOK001 TITLE', book.title
    assert_equal 'ACC001', book.accountId
    assert_equal 'PRO003', book.profileId
    assert_equal '2020-09-02T16:00:00Z', book.createdAt
    assert_equal '2020-09-16T10:00:00', book.startsAt
    assert_equal '2020-09-16T11:00:00', book.endsAt
    assert_equal 'NOT_USED', book.tentative
    assert_equal 'Asia/Tokyo', book.timeZone
    assert_equal false, book.cancelled
  end

  def assert_booking_p003b001_many_fields(book)
    assert_booking_p003b001(book)
    assert_equal 'https://api.youcanbook.me/v1/ACC001/remoteaccounts/REMOTE003/calendars/foobar%40example.com/events/EV001', book.remoteId
    assert_equal 'en_US', book.locale
    assert_equal '', book.cancellationReason
    assert_equal 'REF_PRO003_BOOK001', book.ref
    assert_equal 1, book.units
    assert_equal '100.101.102.103', book.ip
    assert_equal 0, book.price
    assert_equal 'USD', book.currency
    assert_equal 0, book.appointmentTypes.length
    assert_equal '', book.linkFields
    assert_equal 3, book.answers.length
    assert_nil book.actions
    assert_nil book.lobby
    assert_equal false, book.preview
    assert_equal 'OWNER_SECRET_001', book.ownerSecret
    assert_equal 'LOBBY_PASSWORD_001', book.lobbyPassword
    assert_equal 'en_US', book.displayLocale
    assert_equal 'Asia/Tokyo', book.displayTimeZone
    assert_equal '2020-09-16T01:00:00Z', book.startsAtUTC
    assert_equal 100, book.currencyFactor
    assert_equal '2020-09-16T02:00:00Z', book.endsAtUTC
    assert !book.startRescheduledFromUTC.nil?
    assert_equal '1H', book.displayDurationShort
    assert_equal 'USD 0.00', book.displayPrice
    assert_equal '1 hour', book.displayDurationFull
    assert_equal 60, book.durationMinutes
    assert_equal 0, book.services.length
    assert_equal 'future', book.timeline
    assert book.cancellable
    assert_equal false, book.cancelReasonRequired
    assert_equal '9/2/20 4:00 PM', book.displayCreatedAtShortShort
    assert_equal 'Wednesday, September 16, 2020 10:00 AM (1 hour)', book.displayStartsAtFullShortAndDurationFull
    assert_equal 'Sep 16, 2020 10:00 AM', book.displayStartsAtMediumShort
    assert_equal 'Sep 16, 2020 11:00 AM', book.displayEndsAtMediumShort
    assert_equal 'Sep 16, 2020 10:00 AM', book.displayBookerStartsAtMediumShort
    assert_equal 'Sep 16, 2020 11:00 AM', book.displayBookerEndsAtMediumShort
    assert_equal 'Sep 2, 2020 04:00:00 PM', book.displayCreatedAtMedium
  end

  def assert_profile001(profile)
    assert_equal 'PRO001', profile.id
    assert_equal 'ACC001', profile.accountId
    assert_equal 'FooBar1', profile.title
    assert_equal 'FooBar1 description', profile.description
    assert_equal 'foobar1', profile.subdomain
    assert_nil profile.timeZone
    assert_equal 'ONLINE', profile.status
  end

  def assert_profile001_many_fields(profile)
    assert_profile001(profile)
    assert_equal '2020-08-01T10:30:00Z', profile.createdAt
    assert_equal '2020-08-02T10:30:00Z', profile.updatedAt
    assert profile.timeZoneOverride
    assert profile.captchaActive
    assert_nil profile.locale
    assert_equal '', profile.accessCode
    assert_nil profile.timesPattern
    assert_nil profile.datesPattern
    assert_equal 6, profile.questions.length
    assert_equal 0, profile.remoteReminders.length
    assert !profile.afterwards.nil?
    assert !profile.vouchers.nil?
    assert !profile.calendars.nil?
    assert_equal 1, profile.availableAccounts.length
    assert !profile.cancelOrReschedule.nil?
    assert !profile.display.nil?
    assert !profile.payments.nil?
    assert !profile.appointmentTypes.nil?
    assert !profile.teamMembers.nil?
    assert !profile.tentative.nil?
    assert !profile.times.nil?
    assert_equal 'REALTIME_TOPIC_001', profile.realtimeTopic
    assert_equal false, profile.htmlAllowed
    assert_equal false, profile.protectedByAccessCode
    assert !profile.services.nil?
    assert_equal '', profile.password
    assert_equal 8, profile.actions.length
  end

  def assert_profile002(profile)
    assert_equal 'PRO002', profile.id
    assert_equal 'ACC001', profile.accountId
    assert_equal 'FooBar2', profile.title
    assert_equal 'FooBar2 description', profile.description
    assert_equal 'foobar2', profile.subdomain
    assert_nil profile.timeZone
    assert_equal 'OFFLINE', profile.status
  end

  def assert_profile002_many_fields(profile)
    assert_profile002(profile)
    assert_equal '2020-08-11T10:30:00Z', profile.createdAt
    assert_equal '2020-08-12T10:30:00Z', profile.updatedAt
    assert profile.timeZoneOverride
    assert profile.captchaActive
    assert_nil profile.locale
    assert_nil profile.accessCode
    assert_nil profile.timesPattern
    assert_nil profile.datesPattern
    assert_equal 6, profile.questions.length
    assert_equal 0, profile.remoteReminders.length
    assert !profile.afterwards.nil?
    assert !profile.vouchers.nil?
    assert !profile.calendars.nil?
    assert_equal 1, profile.availableAccounts.length
    assert !profile.cancelOrReschedule.nil?
    assert !profile.display.nil?
    assert !profile.payments.nil?
    assert !profile.appointmentTypes.nil?
    assert !profile.teamMembers.nil?
    assert !profile.tentative.nil?
    assert !profile.times.nil?
    assert_equal 'REALTIME_TOPIC_002', profile.realtimeTopic
    assert_equal false, profile.htmlAllowed
    assert_equal false, profile.protectedByAccessCode
    assert !profile.services.nil?
    assert_nil profile.password
    assert_equal 8, profile.actions.length
  end

  def assert_profile003(profile)
    assert_equal 'PRO003', profile.id
    assert_equal 'ACC001', profile.accountId
    assert_equal 'FooBar3', profile.title
    assert_equal 'FooBar3 description', profile.description
    assert_equal 'foobar3', profile.subdomain
    assert_nil profile.timeZone
    assert_equal 'ONLINE', profile.status
  end

  def assert_profile003_many_fields(profile)
    assert_profile003(profile)
    assert_equal '2020-08-21T10:30:00Z', profile.createdAt
    assert_equal '2020-08-22T10:30:00Z', profile.updatedAt
    assert profile.timeZoneOverride
    assert profile.captchaActive
    assert_nil profile.locale
    assert_equal '', profile.accessCode
    assert_nil profile.timesPattern
    assert_nil profile.datesPattern
    assert_equal 3, profile.questions.length
    assert_equal 0, profile.remoteReminders.length
    assert !profile.afterwards.nil?
    assert !profile.vouchers.nil?
    assert !profile.calendars.nil?
    assert_equal 1, profile.availableAccounts.length
    assert !profile.cancelOrReschedule.nil?
    assert !profile.display.nil?
    assert !profile.payments.nil?
    assert !profile.appointmentTypes.nil?
    assert !profile.teamMembers.nil?
    assert !profile.tentative.nil?
    assert !profile.times.nil?
    assert_equal 'REALTIME_TOPIC_003', profile.realtimeTopic
    assert_equal false, profile.htmlAllowed
    assert_equal false, profile.protectedByAccessCode
    assert !profile.services.nil?
    assert_equal '', profile.password
    assert_equal 7, profile.actions.length
  end

  private

  def assert_error(proc, ex_message)
    e = assert_raises YouCanBookMe::Error do
      proc.call
    end
    assert_equal ex_message, e.message
  end

  def assert_required_error(proc, arg_name)
    assert_error(proc, "#{arg_name} is required.")
  end
end
