require 'open-uri'

module Razsell
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
