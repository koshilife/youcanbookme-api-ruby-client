# frozen_string_literal: true

require 'test_helper'

module YouCanBookMe
  # test for YouCanBookMe::Client
  class ClientTest < BaseTest
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
      params = { fields: fields.join(',') }
      url = "#{@base_host}?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      assert_account001_many_fields @client.account fields: fields

      res_body = load_test_data 'account_001_profiles_fields.json'
      fields = ['id', 'profiles', 'profiles.id', 'profiles.actions', 'profiles.actions.anchor', 'profiles.actions.title', 'profiles.actions.type']
      params = { fields: fields.join(',') }
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
      params = { fields: fields.join(',') }
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

    def test_that_it_returns_all_items_of_bookings
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
      params = { fields: fields.join(',') }
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
      params = { fields: fields.join(',') }
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
      params = { fields: fields.join(',') }
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
      params = { fields: fields.join(',') }
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
  end
end
