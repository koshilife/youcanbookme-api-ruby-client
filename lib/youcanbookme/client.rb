# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe APIs client.
  class Client
    API_HOST = 'https://api.youcanbook.me'
    API_VERSION = 'v1'

    # @param [String] account_id a YouCanBook.me's account id(or email).
    # @param [String] password_or_token a YouCanBook.me's account password or token.
    # @raise [YouCanBookMe::Error] if the account_id is empty.
    # @raise [YouCanBookMe::Error] if the password_or_token is empty.
    def initialize(account_id = nil, password_or_token = nil)
      @config = YouCanBookMe.configuration
      @account_id = account_id || @config.account_id
      @password_or_token = password_or_token || @config.password_or_token

      check_not_empty @account_id, 'account_id'
      check_not_empty @password_or_token, 'password_or_token'
      @connection = HttpCommand.new @account_id, @password_or_token
    end

    #
    # Get basic information about current account.
    #
    # @param [Array<String>] fields the fields which are included in the response.
    # @return [Account]
    # @since 0.0.1
    def account(fields = nil)
      params = set_fields_into_params fields
      res = @connection.get account_path, params
      Account.new res.body, self
    end

    #
    # Returns a single Profile by its id.
    #
    # @param [String] profile_id  the profile's unique id.
    # @param [Array<String>] fields the fields which are included in the response.
    # @return [Profile]
    # @since 0.0.2
    def profile(profile_id, fields = nil)
      check_not_empty profile_id, 'profile_id'
      params = set_fields_into_params fields
      res = @connection.get profile_path(profile_id), params
      Profile.new res.body, self
    end

    #
    # Get List of Profile.
    #
    # @param [Array<String>] fields the fields which are included in the response.
    # @return [Array<Profile>]
    # @since 0.0.2
    def profiles(fields = nil)
      params = set_fields_into_params fields
      res = @connection.get profile_path, params
      items = res.body
      unless items.is_a? Array
        raise YouCanBookMe::Error, 'the response data is not Array.'
      end

      items.map { |item| Profile.new item, self }
    end

    #
    # Get suggested subdomains
    #
    # @return [Array<String>]
    # @since 0.0.1
    def suggested_subdomains
      res = @connection.get "/#{API_VERSION}/suggestedsubdomains"
      res.body
    end

    #
    # Get the subdomain is available or not.
    #
    # @param [String] subdomain
    # @return [Boolean]
    # @raise [YouCanBookMe::Error] if the subdomain arg is empty.
    # @since 0.0.1
    def subdomain_available?(subdomain)
      check_not_empty subdomain, 'subdomain'
      res = @connection.get "/#{API_VERSION}/subdomains/#{subdomain}"
      res.body[:free]
    end

    private

    def check_not_empty(value, name)
      raise YouCanBookMe::Error, "#{name} is required." if blank? value
    end

    def blank?(value)
      return true if value.nil?
      return true if value.to_s.empty?

      false
    end

    def set_fields_into_params(fields, params = nil)
      params ||= {}
      return params unless fields
      return params unless fields.is_a? Array
      return params if fields.empty?

      params.merge(fields: fields.join(','))
    end

    def account_path
      "/#{API_VERSION}/#{@account_id}"
    end

    def profile_path(profile_id = nil)
      path = "#{account_path}/profiles"
      return path unless profile_id

      "#{path}/#{profile_id}"
    end
  end
end
