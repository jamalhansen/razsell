require 'sort_methods'
require 'errors/missing_api_key_error'

module Razsell
  class Query
    include Razsell::SortMethods

    attr_accessor :sort_method, :start_page, :items_per_page, :keywords, :product_type

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
      @start_page = 1
      @items_per_page = 50
      @keywords = []
    end
  end
end
