require 'open-uri'

module Razsell
  # Class that wraps http calls
  class HttpService
    def get query
      if query.class == String
        url = query
      else
        url = query.to_url
      end

      open(url)
    end
  end
end
