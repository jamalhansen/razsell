require 'sort_methods'
require 'image_sizes'

module Razsell
  class Query
    include Razsell::SortMethods
    include Razsell::ImageSizes

    attr_accessor :page_limit
    attr_reader :artist

    def initialize *args
      set_default_page_limit
\
      default_criteria

      @keys = { :keywords => 'qs', :product_line => 'cg', :product_type => 'pt',
        :sort_type => 'st', :sort_period => 'sp', :page => 'pg', :items_per_page => 'ps',
        :feed_type => 'ft', :image_size => 'isz', :image_background_color => 'bg',
        :opensearch => 'opensearch', :source => 'src'}
    end

    def for_artist artist
      @artist = artist
      self
    end

    def add_criteria name, value
      
    end

    def base_url
      return "http://feed.zazzle.com/#{@artist}/rss" if @artist
      "http://feed.zazzle.com/rss"
    end

    def to_querystring
      @querystring.to_a.map { |a| "#{get_querystring_identifier(a[0])}=#{a[1].to_s}" }.sort {|x,y| x <=> y }.join("&")
    end

    private
      def get_querystring_identifier key
        return @keys[key] if @keys[key]
        "key#{key}"
      end
      
      def set_default_page_limit
        @page_limit = 5
      end

      def default_criteria
        @querystring = {:page => 1, :sort_type => POPULARITY,
          :items_per_page => 50, :image_background_color => "FFFFFF",
          :image_size => LARGE, :source => 'razsell', :opensearch => 1, :feed_type => "rss"}
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



      attr_querystring_read :keywords, :product_line, :product_type,
        :sort_type, :sort_period, :page, :items_per_page,
        :feed_type, :image_size, :image_background_color,
        :opensearch, :source
      attr_querystring_write :keywords, :product_line, :product_type,
        :sort_type, :sort_period, :image_size, :image_background_color

  end
end
