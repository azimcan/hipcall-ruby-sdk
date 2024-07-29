module Hipcall
  class Resource
    def self.get_request(url, params: {}, headers: {})
      handle_response client.connection.get(url, params, headers)
    end

    def self.post_request(url, body:, headers: {})
      handle_response client.connection.post(url, body, headers)
    end

    def self.patch_request(url, body:, headers: {})
      handle_response client.connection.patch(url, body, headers)
    end

    def self.put_request(url, body:, headers: {})
      handle_response client.connection.put(url, body, headers)
    end

    def self.delete_request(url, params: {}, headers: {})
      handle_response client.connection.delete(url, params, headers)
    end

    def self.request(method:, path:, params: {}, headers: {})
      connection = Faraday.new(Hipcall.base_url + Hipcall.version) do |con|
        con.request :authorization, :Bearer, Hipcall.api_key
        con.request :json, accept: "application/json"
        con.response :json, content_type: "application/json"
        con.adapter Hipcall.adapter, Hipcall.stubs
      end

      connection.send method, path, params, headers
    end

    private

    def handle_response(response)
      message = response.body["errors"]
      case response.status
      when 400
        raise Error, message
      when 401
        raise Error, message
      when 403
        raise Error, message
      when 404
        raise Error, message
      when 419
        raise Error, message
      when 422
        raise Error, message
      when 429
        raise Error, message
      when 500
        raise Error, message
      end

      response
    end
  end
end
