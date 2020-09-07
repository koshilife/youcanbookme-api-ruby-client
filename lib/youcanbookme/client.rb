# frozen_string_literal: true

module YouCanBookMe
  # YouCanBookMe APIs client.
  class Client # rubocop:disable Metrics/ClassLength
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
    def account(fields: nil)
      params = build_fields_params fields
      res = @connection.get account_path, params
      Account.new res.body, self
    end

    #
    # Returns a single Booking by associated ids.
    #
    # @param [String] profile_id the profile's unique id.
    # @param [String] booking_id the booking's unique id.
    # @param [Array<String>] fields the fields which are included in the response.
    # @param [Hash] options the optional request parameters.
    # @option options [String] :bsec
    # @option options [String] :displayTimeZone
    # @option options [String] :osec
    # @return [Booking]
    # @since 0.0.3
    def booking(profile_id, booking_id, fields: nil, options: nil)
      check_not_empty profile_id, 'profile_id'
      check_not_empty booking_id, 'booking_id'
      path = booking_path profile_id, booking_id
      opts_keys = %i[bsec displayTimeZone osec]
      params = build_option_params options, opts_keys, fields: fields
      res = @connection.get path, params
      Booking.new res.body, self
    end

    #
    # Get List of Bookings.
    #
    # @param [Array<String>] fields the fields which are included in the response.
    # @param [Hash] options the optional request parameters.
    # @option options [String] :boundaryId
    # @option options [String] :boundaryStartsAt
    # @option options [String] :direction
    # @option options [String] :displayTimeZone
    # @option options [String] :jumpToDate
    # @option options [String] :profileIds
    # @option options [String] :search
    # @return [Array<Booking>]
    # @since 0.0.3
    def bookings(fields: nil, options: nil)
      opts_keys = %i[boundaryId boundaryStartsAt direction displayTimeZone jumpToDate profileIds search]
      params = build_option_params options, opts_keys, fields: fields
      res = @connection.get booking_path, params
      map_as_collection res, Booking
    end

    #
    # Get List of Bookings associated by profile_id.
    #
    # @param [String] profile_id the profile's unique id.
    # @param [Array<String>] fields the fields which are included in the response.
    # @param [Hash] options the optional request parameters.
    # @option options [String] :boundaryId
    # @option options [String] :boundaryStartsAt
    # @option options [String] :direction
    # @option options [String] :displayTimeZone
    # @option options [String] :jumpToDate
    # @option options [String] :profileIds
    # @option options [String] :search
    # @return [Array<Booking>]
    # @since 0.0.3
    def profile_bookings(profile_id, fields: nil, options: nil)
      check_not_empty profile_id, 'profile_id'
      path = booking_path profile_id
      opts_keys = %i[boundaryId boundaryStartsAt direction displayTimeZone jumpToDate profileIds search]
      params = build_option_params options, opts_keys, fields: fields
      res = @connection.get path, params
      map_as_collection res, Booking
    end

    #
    # Returns a single Calendar by its id.
    #
    # @param [String] remote_account_id the remote_account's unique id.
    # @param [String] calendar_id the calendar's unique id.
    # @param [Array<String>] fields the fields which are included in the response.
    # @return [Calendar]
    # @since 0.0.6
    def calendar(remote_account_id, calendar_id, fields: nil)
      check_not_empty remote_account_id, 'remote_account_id'
      check_not_empty calendar_id, 'calendar_id'
      params = build_fields_params fields
      path = calendar_path remote_account_id, calendar_id
      res = @connection.get path, params
      Calendar.new res.body, self
    end

    #
    # Get List of Calendar.
    #
    # @param [String] remote_account_id the remote_account's unique id.
    # @param [Array<String>] fields the fields which are included in the response.
    # @return [Array<Calendar>]
    # @since 0.0.6
    def calendars(remote_account_id, fields: nil)
      check_not_empty remote_account_id, 'remote_account_id'
      params = build_fields_params fields
      path = calendar_path remote_account_id
      res = @connection.get path, params
      map_as_collection res, Calendar
    end

    #
    # Returns a single Event by its id.
    #
    # @param [String] remote_account_id the remote_account's unique id.
    # @param [String] calendar_id the calendar's unique id.
    # @param [String] event_id the event's unique id.
    # @param [Array<String>] fields the fields which are included in the response.
    # @return [Event]
    # @since 0.0.6
    def event(remote_account_id, calendar_id, event_id, fields: nil)
      check_not_empty remote_account_id, 'remote_account_id'
      check_not_empty calendar_id, 'calendar_id'
      check_not_empty event_id, 'event_id'
      params = build_fields_params fields
      path = event_path remote_account_id, calendar_id, event_id
      res = @connection.get path, params
      Event.new res.body, self
    end

    #
    # Returns a single Profile by its id.
    #
    # @param [String] profile_id the profile's unique id.
    # @param [Array<String>] fields the fields which are included in the response.
    # @return [Profile]
    # @since 0.0.2
    def profile(profile_id, fields: nil)
      check_not_empty profile_id, 'profile_id'
      params = build_fields_params fields
      res = @connection.get profile_path(profile_id), params
      Profile.new res.body, self
    end

    #
    # Get List of Profile.
    #
    # @param [Array<String>] fields the fields which are included in the response.
    # @return [Array<Profile>]
    # @since 0.0.2
    def profiles(fields: nil)
      params = build_fields_params fields
      res = @connection.get profile_path, params
      map_as_collection res, Profile
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

    #
    # Returns a single RemoteAccount by its id.
    #
    # @param [String] remote_account_id the remote account's unique id.
    # @param [Array<String>] fields the fields which are included in the response.
    # @return [YouCanBookMe::RemoteAccount]
    # @raise [YouCanBookMe::Error] if the subdomain arg is empty.
    # @since 0.0.5
    def remote_account(remote_account_id, fields: nil)
      check_not_empty remote_account_id, 'remote_account_id'
      params = build_fields_params fields
      path = remote_account_path(remote_account_id)
      res = @connection.get path, params
      RemoteAccount.new res.body, self
    end

    #
    # Get List of Remote Account.
    #
    # @param [Array<String>] fields the fields which are included in the response.
    # @return [Array<YouCanBookMe::RemoteAccount>]
    # @since 0.0.5
    def remote_accounts(fields: nil)
      params = build_fields_params fields
      res = @connection.get remote_account_path, params
      map_as_collection res, RemoteAccount
    end

  private

    def check_not_empty(value, name)
      raise YouCanBookMe::Error.new("#{name} is required.") if blank? value
    end

    def blank?(value)
      return true if value.nil?
      return true if value.to_s.empty?

      false
    end

    def account_path
      "/#{API_VERSION}/#{@account_id}"
    end

    def booking_path(profile_id = nil, booking_id = nil)
      return "#{account_path}/bookings" unless profile_id

      path = "#{profile_path(profile_id)}/bookings"
      return path unless booking_id

      "#{path}/#{booking_id}"
    end

    def calendar_path(remote_account_id, calendar_id = nil)
      remote_path = remote_account_path remote_account_id
      path = "#{remote_path}/calendars"
      return path unless calendar_id

      "#{path}/#{calendar_id}"
    end

    def event_path(remote_account_id, calendar_id, event_id = nil)
      cal_path = calendar_path remote_account_id, calendar_id
      path = "#{cal_path}/events"
      return path unless event_id

      "#{path}/#{event_id}"
    end

    def profile_path(profile_id = nil)
      path = "#{account_path}/profiles"
      return path unless profile_id

      "#{path}/#{profile_id}"
    end

    def remote_account_path(remote_account_id = nil)
      path = "#{account_path}/remoteaccounts"
      return path unless remote_account_id

      "#{path}/#{remote_account_id}"
    end

    def build_option_params(options, filters, fields: nil)
      options ||= {}
      build_fields_params fields, options.slice(*filters)
    end

    def build_fields_params(fields, params = nil)
      params ||= {}
      return params unless fields
      return params unless fields.is_a? Array
      return params if fields.empty?

      params.merge(fields: fields.join(','))
    end

    def map_as_collection(response, klass)
      items = response.body
      raise YouCanBookMe::Error.new('the response data is not Array.') unless items.is_a? Array

      items.map { |item| klass.new item, self }
    end
  end
end
