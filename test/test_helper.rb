$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "hipcall"
require "minitest/autorun"
require "faraday"
require "json"

class Minitest::Test
  def stub_request(method, path, response:, params: {})
    hipcall_configuration Faraday::Adapter::Test::Stubs.new do |stub|
      arguments = [method, "https://use.hipcall.com/api/v3/#{path}"]
      arguments << params.to_json if %i[post put patch].include?(method)
      stub.send(*arguments) { |_env| response }
    end
  end

  def stub_response(fixture:, status: 200, headers: { "Content-Type" => "application/json" })
    [status, headers, File.read("test/fixtures/v3/#{fixture}.json")]
  end

  def hipcall_configuration(stub = nil)
    Hipcall.api_key = "fake"
    Hipcall.base_url = "https://use.hipcall.com/api/"
    Hipcall.version = "v3"
    Hipcall.adapter = :test
    Hipcall.stubs = stub
  end
end
