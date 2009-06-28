require 'sort_methods'

module Razsell
  class Query
    include Razsell::SortMethods

    attr_accessor :sort_method

    def initialize *args
      raise Razsell::MissingApiKeyError unless args[0]
      @api_key = args[0]
      @opts = args[1]

      default_criteria
    end

    def add_criteria name, value
      
    end

    def default_criteria
      @sort_method = POPULARITY
    end
  end
end
