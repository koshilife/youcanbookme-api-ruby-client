# frozen_string_literal: true

module AssertHelper
  def assert_account001(acc)
    assert_equal 'ACC001', acc.id
    assert_equal 'foobar@example.com', acc.email
    assert_equal 0, acc.smsCredits
  end

  def assert_account001_many_fields(acc)
    assert_equal 'ACC001', acc.id
    assert_equal '2020-08-01T13:00:00Z', acc.createdAt
    assert_equal 'foobar@example.com', acc.email
    assert_equal 'Bar', acc.familyName
    assert_equal 'Foo', acc.givenName
    assert_equal true, acc.gridBranding
    assert_equal 'FooBar.org', acc.organisation
    assert_equal 'ja', acc.locale
    assert_equal 'UTC', acc.timeZone
    assert_equal 'Developer', acc.tags
    assert_equal 0, acc.smsCredits
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
