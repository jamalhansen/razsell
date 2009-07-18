require 'open-uri'

module Razsell
  class HttpService
    def get query
      open(query.to_url)
    end
  end
end
