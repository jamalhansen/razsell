require 'sort_methods'
require 'grid_cell_sizes'
require 'errors/missing_api_key_error'

module Razsell
  class Query
    include Razsell::SortMethods
    include Razsell::GridCellSizes

    attr_accessor :page_limit
    attr_reader :contributer

    def initialize *args
      raise Razsell::MissingApiKeyError unless args[0]
      set_default_page_limit
\
      default_criteria args[0]
    end

    def for_contributer contributer
      @contributer = contributer
      self
    end

    def add_criteria name, value
      
    end

    def base_url
      return "http://feed.zazzle.com/#{@contributer}/feed" if @contributer
      "http://feed.zazzle.com/feed"
    end

    private
      def set_default_page_limit
        @page_limit = 5
      end

      def default_criteria api_key
        @querystring = {:api_key => api_key, :sort_method => POPULARITY, :start_page => 1,
          :items_per_page => 50, :keywords => [], :grid_cell_background_color => "FFFFFF",
          :grid_cell_size => LARGE, :source => 'razsell', :opensearch => "true", :ft => "gb"}
      end

      def self.attr_querystring_read(*args)
        @querystring = {}

        args.each do |attribute|
          define_method "#{attribute}" do
            @querystring[attribute]
          end
        end
      end

      def self.attr_querystring_write(*args)
        @querystring = {}

        args.each do |attribute|
          define_method "#{attribute}=" do |value|
            @querystring[attribute] = value
          end\
        end
      end

      attr_querystring_read :sort_method, :start_page, :items_per_page, :keywords, :product_type,
        :grid_cell_size, :grid_cell_background_color, :associate, :source, :opensearch, :ft
      attr_querystring_write :sort_method, :start_page, :items_per_page, :keywords, :product_type,
        :grid_cell_size, :grid_cell_background_color, :associate

  end
end
