# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'simplecov'
SimpleCov.start
if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end
require 'minitest/autorun'
require 'webmock/minitest'
require 'youcanbookme'
require 'assert_helper'

require 'base64'
require 'logger'
class MyLogger < Logger; end

class BaseTest < Minitest::Test
  include AssertHelper

  HOST = "#{YouCanBookMe::Client::API_HOST}/#{YouCanBookMe::Client::API_VERSION}"

  def setup
    @account_id = 'foobar@example.com'
    @password_or_token = 'TOKEN'
    @my_logger = MyLogger.new STDOUT
    @my_logger.level = :info
    @base_host = "#{HOST}/#{@account_id}"

    reset_configuration
    @client = YouCanBookMe::Client.new @account_id, @password_or_token
  end

  def init_configuration
    YouCanBookMe.configure do |c|
      c.account_id = @account_id
      c.password_or_token = @password_or_token
      c.logger = @my_logger
    end
  end

  def reset_configuration
    YouCanBookMe.configure do |c|
      c.account_id = nil
      c.password_or_token = nil
      c.logger = @my_logger
    end
  end

  private

  def default_request_headers
    secret = Base64.strict_encode64 "#{@account_id}:#{@password_or_token}"
    {
      'Authorization' => "Basic #{secret}"
    }
  end

  def default_response_headers
    {
      'Content-Type' => 'application/json; charset=utf-8'
    }
  end

  def load_test_data(filename)
    filepath = File.join File.dirname(__FILE__), 'testdata', filename
    File.new(filepath).read
  end

  def add_stub_request(method, url, req_headers: nil, req_body: nil, res_status: nil, res_headers: nil, res_body: nil)
    WebMock.enable!
    req_headers ||= default_request_headers
    res_headers ||= default_response_headers
    res_status ||= 200
    stub_request(method, url).with(body: req_body, headers: req_headers).to_return(status: res_status, body: res_body, headers: res_headers)
  end
end
