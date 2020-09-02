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
      assert_account001_many_fields @client.account fields

      res_body = load_test_data 'account_001_profiles_fields.json'
      fields = ['id', 'profiles', 'profiles.id', 'profiles.actions', 'profiles.actions.anchor', 'profiles.actions.title', 'profiles.actions.type']
      params = { fields: fields.join(',') }
      url = "#{@base_host}?#{URI.encode_www_form(params)}"
      add_stub_request :get, url, res_body: res_body
      assert_account001_profiles_fields @client.account fields
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
