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
