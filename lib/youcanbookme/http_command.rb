# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module YouCanBookMe
  # Command for HTTP request.
  class HttpCommand
    include CommonModule

    def initialize(account_id, password_or_token, host = nil)
      @account_id = account_id
      @password_or_token = password_or_token
      @host = host || YouCanBookMe::Client::API_HOST
    end

    #
    # send GET http request.
    #
    # @param [String] path String or URI to access.
    # @param [Hash] params Hash of URI query unencoded key/value pairs.
    # @since 0.0.1
    def get(path, params = {})
      debug_log "GET #{connection.build_url("#{@host}#{path}", params)}"
      res = connection.get path, params
      debug_log "Response status:#{res.status}, body:#{res.body}"
      res
    end

    #
    # send POST http request.
    #
    # @param [String] path String or URI to access.
    # @param [Hash] body_params
    # The request body that will eventually be converted to JSON.
    # @since 0.0.1
    def post(path, body_params = {})
      debug_log "POST #{@host}#{path} body:#{body_params}"
      headers = { 'Content-Type' => 'application/json' }
      res = connection.run_request :post, path, body_params.to_json, headers
      debug_log "Response status:#{res.status}, body:#{res.body}"
      res
    end

    #
    # send PUT http request.
    #
    # @param [String] path String or URI to access.
    # @param [Hash] body_params
    # The request body that will eventually be converted to JSON.
    # @since 0.0.1
    def put(path, body_params = {})
      debug_log "PUT #{@host}#{path} body:#{body_params}"
      headers = { 'Content-Type' => 'application/json' }
      res = connection.run_request :put, path, body_params.to_json, headers
      debug_log "Response status:#{res.status}, body:#{res.body}"
      res
    end

    #
    # send PATCH http request.
    #
    # @param [String] path String or URI to access.
    # @param [Hash] body_params
    # The request body that will eventually be converted to JSON.
    # @since 0.0.1
    def patch(path, body_params = {})
      debug_log "PATCH #{@host}#{path} body:#{body_params}"
      headers = { 'Content-Type' => 'application/json' }
      res = connection.run_request :put, path, body_params.to_json, headers
      debug_log "Response status:#{res.status}, body:#{res.body}"
      res
    end

    #
    # send DELETE http request.
    #
    # @param [String] path String or URI to access.
    # @param [Hash] params Hash of URI query unencoded key/value pairs.
    # @since 0.0.1
    def delete(path, params = {})
      debug_log "DELETE #{@host}#{path} params:#{params}"
      res = connection.delete path, params
      debug_log "Response status:#{res.status}, body:#{res.body}"
      res
    end

    private

    def connection
      Faraday.new(
        url: @host
      ) do |builder|
        builder.use Faraday::Request::BasicAuthentication, @account_id, @password_or_token
        builder.response :json, parser_options: { symbolize_names: true }, content_type: /\bjson$/
      end
    end
  end
end
