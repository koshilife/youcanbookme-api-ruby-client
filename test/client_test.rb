# frozen_string_literal: true

require 'test_helper'

module YouCanBookMe
  # test for YouCanBookMe::Client
  class ClientTest < BaseTest # rubocop:disable Metrics/ClassLength
    #
    # test for initialize
    #

    def test_that_it_returns_account_id_empty_error
      proc_generate_client = proc do
        YouCanBookMe::Client.new nil, @password_or_token
      end
      assert_required_error proc_generate_client, 'account_id'
    end

    def test_that_it_returns_password_or_token_empty_error
      proc_generate_client = proc do
        YouCanBookMe::Client.new @account_id, nil
      end
      assert_required_error proc_generate_client, 'password_or_token'
    end

    def test_that_it_configure_client
      init_configuration
      config = YouCanBookMe.configuration
      assert_equal @account_id, config.account_id
      assert_equal @password_or_token, config.password_or_token
      assert_equal @my_logger, config.logger
      YouCanBookMe::Client.new
    end

    #
    # test for account
    #

    def test_that_it_returns_a_current_account
      res_body = load_test_data 'account_001.json'
      add_stub_request :get, @base_host, res_body: res_body
      assert_account001 @client.account

      res_body = load_test_data 'account_001_many_fields.json'
      fields = YouCanBookMe::Account.fields
      params = {fields: fields.join(',')}
      url = "#{@base_host}?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      assert_account001_many_fields @client.account fields: fields

      res_body = load_test_data 'account_001_profiles_fields.json'
      fields = ['id', 'profiles', 'profiles.id', 'profiles.actions', 'profiles.actions.anchor', 'profiles.actions.title', 'profiles.actions.type']
      params = {fields: fields.join(',')}
      url = "#{@base_host}?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      assert_account001_profiles_fields @client.account fields: fields
    end

    #
    # test for booking
    #

    def test_that_it_returns_a_specific_booking
      profile_id = 'PRO001'
      booking_id = 'PRO001_BOOK001'
      res_body = load_test_data 'booking_001.json'
      url = "#{@base_host}/profiles/#{profile_id}/bookings/#{booking_id}"
      add_stub_request :get, url, res_body: res_body
      assert_booking_p001b001 @client.booking profile_id, booking_id

      res_body = load_test_data 'booking_001_many_fields.json'
      fields = YouCanBookMe::Booking.fields
      params = {fields: fields.join(',')}
      url = "#{@base_host}/profiles/#{profile_id}/bookings/#{booking_id}?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      booking = @client.booking profile_id, booking_id, fields: fields
      assert_booking_p001b001_many_fields booking
    end

    def test_that_it_returns_an_argument_error_on_booking
      proc_profile_id_is_empty = proc do
        @client.booking '', 'booking_id'
      end
      assert_required_error proc_profile_id_is_empty, 'profile_id'
      proc_booking_id_is_empty = proc do
        @client.booking 'profile_id', ''
      end
      assert_required_error proc_booking_id_is_empty, 'booking_id'
    end

    #
    # test for bookings
    #

    def test_that_it_returns_all_items_of_bookings # rubocop:disable Metrics/MethodLength
      res_body = load_test_data 'bookings_001.json'
      url = "#{@base_host}/bookings"
      add_stub_request :get, url, res_body: res_body
      bookings = @client.bookings
      assert_equal 5, bookings.length
      assert_booking_p001b001 bookings[0]
      assert_booking_p001b002 bookings[1]
      assert_booking_p001b003 bookings[2]
      assert_booking_p002b001 bookings[3]
      assert_booking_p003b001 bookings[4]

      res_body = load_test_data 'bookings_001_many_fields.json'
      fields = YouCanBookMe::Booking.fields
      params = {fields: fields.join(',')}
      url = "#{@base_host}/bookings?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      bookings = @client.bookings fields: fields
      assert_equal 5, bookings.length
      assert_booking_p001b001_many_fields bookings[0]
      assert_booking_p001b002_many_fields bookings[1]
      assert_booking_p001b003_many_fields bookings[2]
      assert_booking_p002b001_many_fields bookings[3]
      assert_booking_p003b001_many_fields bookings[4]
    end

    #
    # test for calendar
    #

    def test_that_it_returns_a_specific_calendar
      remote_account_id = 'RA001'
      calendar_id = 'RA001_CAL001'
      res_body = load_test_data 'calendar_001.json'
      url = "#{@base_host}/remoteaccounts/#{remote_account_id}/calendars/#{calendar_id}"
      add_stub_request :get, url, res_body: res_body
      assert_calendar001 @client.calendar remote_account_id, calendar_id

      res_body = load_test_data 'calendar_001_many_fields.json'
      fields = YouCanBookMe::Calendar.fields
      params = {fields: fields.join(',')}
      url = "#{@base_host}/remoteaccounts/#{remote_account_id}/calendars/#{calendar_id}?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      booking = @client.calendar remote_account_id, calendar_id, fields: fields
      assert_calendar001_many_fields booking
    end

    def test_that_it_returns_an_argument_error_on_calendar
      proc_remote_account_id_is_empty = proc do
        @client.calendar '', 'calendar_id'
      end
      assert_required_error proc_remote_account_id_is_empty, 'remote_account_id'
      proc_calendar_id_is_empty = proc do
        @client.calendar 'remote_account_id', ''
      end
      assert_required_error proc_calendar_id_is_empty, 'calendar_id'
    end

    #
    # test for calendars
    #

    def test_that_it_returns_all_items_of_calendars
      remote_account_id = 'RA001'
      res_body = load_test_data 'calendars_001.json'
      url = "#{@base_host}/remoteaccounts/#{remote_account_id}/calendars"
      add_stub_request :get, url, res_body: res_body
      calendars = @client.calendars remote_account_id
      assert_equal 3, calendars.length
      assert_calendar001 calendars[0]
      assert_calendar002 calendars[1]
      assert_calendar003 calendars[2]

      res_body = load_test_data 'calendars_001_many_fields.json'
      fields = YouCanBookMe::Calendar.fields
      params = {fields: fields.join(',')}
      url = "#{@base_host}/remoteaccounts/#{remote_account_id}/calendars?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      calendars = @client.calendars remote_account_id, fields: fields
      assert_equal 3, calendars.length
      assert_calendar001_many_fields calendars[0]
      assert_calendar002_many_fields calendars[1]
      assert_calendar003_many_fields calendars[2]
    end

    #
    # test for event
    #

    def test_that_it_returns_a_specific_event
      remote_account_id = 'RA001'
      calendar_id = 'RA001_CAL001'
      event_id = 'RA001_CAL001_EV001'
      res_body = load_test_data 'event_001.json'
      url = "#{@base_host}/remoteaccounts/#{remote_account_id}/calendars/#{calendar_id}/events/#{event_id}"
      add_stub_request :get, url, res_body: res_body
      assert_event001 @client.event remote_account_id, calendar_id, event_id

      res_body = load_test_data 'event_001_many_fields.json'
      fields = YouCanBookMe::Event.fields
      params = {fields: fields.join(',')}
      url = "#{@base_host}/remoteaccounts/#{remote_account_id}/calendars/#{calendar_id}/events/#{event_id}?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      booking = @client.event remote_account_id, calendar_id, event_id, fields: fields
      assert_event001_many_fields booking
    end

    def test_that_it_returns_an_argument_error_on_event
      proc_remote_account_id_is_empty = proc do
        @client.event '', 'cal_id', 'ev_id'
      end
      assert_required_error proc_remote_account_id_is_empty, 'remote_account_id'
      proc_calendar_id_is_empty = proc do
        @client.event 'remote_id', '', 'ev_id'
      end
      assert_required_error proc_calendar_id_is_empty, 'calendar_id'
      proc_event_id_is_empty = proc do
        @client.event 'remote_id', 'cal_id', ''
      end
      assert_required_error proc_event_id_is_empty, 'event_id'
    end

    #
    # test for profile_bookings
    #

    def test_that_it_returns_all_items_of_profile_bookings
      profile_id = 'PRO001'
      res_body = load_test_data 'profile_bookings_001.json'
      url = "#{@base_host}/profiles/#{profile_id}/bookings"
      add_stub_request :get, url, res_body: res_body
      bookings = @client.profile_bookings profile_id
      assert_equal 3, bookings.length
      assert_booking_p001b001 bookings[0]
      assert_booking_p001b002 bookings[1]
      assert_booking_p001b003 bookings[2]

      res_body = load_test_data 'profile_bookings_001_many_fields.json'
      fields = YouCanBookMe::Booking.fields
      params = {fields: fields.join(',')}
      url = "#{@base_host}/profiles/#{profile_id}/bookings?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      bookings = @client.profile_bookings profile_id, fields: fields
      assert_equal 3, bookings.length
      assert_booking_p001b001_many_fields bookings[0]
      assert_booking_p001b002_many_fields bookings[1]
      assert_booking_p001b003_many_fields bookings[2]
    end

    def test_that_it_returns_an_argument_error_on_profile_bookings
      proc_profile_id_is_empty = proc do
        @client.profile_bookings ''
      end
      assert_required_error proc_profile_id_is_empty, 'profile_id'
    end

    #
    # test for profile
    #

    def test_that_it_returns_a_specific_profile
      profile_id = 'PRO001'
      res_body = load_test_data 'profile_001.json'
      add_stub_request :get, "#{@base_host}/profiles/#{profile_id}", res_body: res_body
      assert_profile001 @client.profile profile_id

      res_body = load_test_data 'profile_001_many_fields.json'
      fields = YouCanBookMe::Profile.fields
      params = {fields: fields.join(',')}
      url = "#{@base_host}/profiles/#{profile_id}?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      assert_profile001_many_fields @client.profile profile_id, fields: fields
    end

    def test_that_it_returns_an_argument_error_on_profile
      proc_profile_id_is_empty = proc do
        @client.profile ''
      end
      assert_required_error proc_profile_id_is_empty, 'profile_id'
    end

    #
    # test for profiles
    #

    def test_that_it_returns_all_items_of_profiles
      res_body = load_test_data 'profiles_001.json'
      add_stub_request :get, "#{@base_host}/profiles", res_body: res_body
      profiles = @client.profiles
      assert_equal 3, profiles.length
      assert_profile001 profiles[0]
      assert_profile002 profiles[1]
      assert_profile003 profiles[2]

      res_body = load_test_data 'profiles_001_many_fields.json'
      fields = YouCanBookMe::Profile.fields
      params = {fields: fields.join(',')}
      url = "#{@base_host}/profiles?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      profiles = @client.profiles fields: fields
      assert_equal 3, profiles.length
      assert_profile001_many_fields profiles[0]
      assert_profile002_many_fields profiles[1]
      assert_profile003_many_fields profiles[2]
    end

    #
    # test for suggested_subdomains
    #

    def test_that_it_returns_suggested_subdomains
      res_body = load_test_data 'suggestedsubdomains_001.json'
      url = "#{HOST}/suggestedsubdomains"
      add_stub_request :get, url, res_body: res_body
      expected = %w[foo-bar foobar-1 foobar-2 foo-developer bar-developer]
      assert_equal expected, @client.suggested_subdomains
    end

    #
    # test for subdomain_available?
    #

    def test_that_it_returns_a_subdomain_available_whethere_or_not
      res_ok_body = load_test_data 'check_subdomain_ok.json'
      ok_subdomain = 'ok_subdomain'
      ok_url = "#{HOST}/subdomains/#{ok_subdomain}"
      add_stub_request :get, ok_url, res_body: res_ok_body

      res_ng_body = load_test_data 'check_subdomain_ng.json'
      ng_subdomain = 'ng_subdomain'
      ng_url = "#{HOST}/subdomains/#{ng_subdomain}"
      add_stub_request :get, ng_url, res_body: res_ng_body

      assert @client.subdomain_available?('ok_subdomain')
      assert_equal false, @client.subdomain_available?('ng_subdomain')
    end

    def test_that_it_returns_an_argument_error_on_subdomain_available
      proc_subdomain_is_empty = proc do
        @client.subdomain_available? ''
      end
      assert_required_error proc_subdomain_is_empty, 'subdomain'
    end

    #
    # test for remote_account
    #

    def test_that_it_returns_a_specific_remote_account
      remote_account_id = 'RA001'
      res_body = load_test_data 'remote_account_001.json'
      add_stub_request :get, "#{@base_host}/remoteaccounts/#{remote_account_id}", res_body: res_body
      assert_remote_account001 @client.remote_account remote_account_id

      res_body = load_test_data 'remote_account_001_many_fields.json'
      fields = YouCanBookMe::RemoteAccount.deep_fields(association_filters: [:links])
      params = {fields: fields.join(',')}
      url = "#{@base_host}/remoteaccounts/#{remote_account_id}?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      assert_remote_account001_many_fields @client.remote_account remote_account_id, fields: fields
    end

    def test_that_it_returns_an_argument_error_on_remote_account
      proc_remote_account_id_is_empty = proc do
        @client.remote_account ''
      end
      assert_required_error proc_remote_account_id_is_empty, 'remote_account_id'
    end

    #
    # test for remote_accounts
    #

    def test_that_it_returns_all_items_of_remote_accounts
      res_ok_body = load_test_data 'remote_accounts_001.json'
      ok_url = "#{@base_host}/remoteaccounts"
      add_stub_request :get, ok_url, res_body: res_ok_body
      r_accs = @client.remote_accounts

      assert_equal 2, r_accs.length
      assert_remote_account001 r_accs[0]
      assert_remote_account002 r_accs[1]

      res_ok_body = load_test_data 'remote_accounts_001_many_fields.json'
      fields = YouCanBookMe::RemoteAccount.deep_fields(association_filters: [:links])
      params = {fields: fields.join(',')}
      url = "#{@base_host}/remoteaccounts?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_ok_body

      r_accs = @client.remote_accounts fields: fields

      assert_equal 2, r_accs.length
      assert_remote_account001_many_fields r_accs[0]
      assert_remote_account002_many_fields r_accs[1]
    end
  end
end
