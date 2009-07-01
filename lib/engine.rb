require 'http_service'

module Razsell
  class Engine
    def initialize opts={}
      @http_service = get_http_service opts
    end

    def request query
      feed = @http_service.get query
      Razsell::Results.new feed
    end

    def get_http_service opts
      opts[:http_service] ? opts[:http_service] : Razsell::HttpService.new
    end
  end
end
