module Hipcall
  class Resource
    def self.request(method, path, params: {}, headers: {})
      raise StandardError, "API key is required" if Hipcall.api_key.nil?
      raise StandardError, "API base URL is required" if Hipcall.base_url.nil?
      raise StandardError, "API version is required" if Hipcall.version.nil?

      connection = Faraday.new(Hipcall.base_url + Hipcall.version) do |con|
        con.request :authorization, :Bearer, Hipcall.api_key
        con.request :json, accept: "application/json"
        con.response :json, content_type: "application/json"
        con.adapter Hipcall.adapter, Hipcall.stubs
      end

      handle_response connection.send(method, path, params, headers)
    end

    def self.handle_response(response)
      message = response.body["errors"]
      case response.status
      when 400
        raise StandardError, message
      when 401
        raise StandardError, message
      when 403
        raise StandardError, message
      when 404
        raise StandardError, message
      when 419
        raise StandardError, message
      when 422
        raise StandardError, message
      when 429
        raise StandardError, message
      when 500
        raise StandardError, message
      end

      response
    end
  end
end
