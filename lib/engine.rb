
module Razsell
  class Engine
    def initialize opts={}
      @http_service = get_http_service opts
    end

    def request query
      @http_service.get query
    end

    def get_http_service opts
      return opts[:http_service] if opts[:http_service]
      Razsell::HttpService.new
    end
  end
end
