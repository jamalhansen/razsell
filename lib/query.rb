require 'sort_methods'
require 'grid_cell_sizes'
require 'errors/missing_api_key_error'

module Razsell
  class Query
    include Razsell::SortMethods
    include Razsell::GridCellSizes

    def initialize *args
      raise Razsell::MissingApiKeyError unless args[0]
\
      default_criteria args[0]
    end

    def add_criteria name, value
      
    end

    def default_criteria api_key
      @querystring = {:api_key => api_key, :sort_method => POPULARITY, :start_page => 1, :items_per_page => 50, :keywords => [], :grid_cell_background_color => "FFFFFF", :grid_cell_size => LARGE}
    end
    
    def self.attr_querystring(*args)
      @querystring = {}

      args.each do |attribute|
        define_method "#{attribute}" do
          @querystring[attribute]
        end

        define_method "#{attribute}=" do |value|
          @querystring[attribute] = value
        end\
      end
    end

    attr_querystring :sort_method, :start_page, :items_per_page, :keywords, :product_type, :grid_cell_size, :grid_cell_background_color, :associate

  end
end
