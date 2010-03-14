require 'razsell/constants'
require 'cgi'

module Razsell

  # Allows you to specify the result set you would like returned
  #
  #  === Attributes that you can specify
  #  * keywords
  #  * product_line
  #  * product_type  (see Razsell::ProductTypes)
  #  * sort_type  (see Razsell::SortMethods)
  #  * sort_period  (see Razsell::SortPeriods)
  #  * image_size  (see Razsell::ImageSizes)
  #  * image_background_color
  #
  # Additionally you can use 
  #
  #   query = Razsell::Query.new.for_artist('some_zazzle_artist')
  #
  # to specify the artist.  Or if you have a link to a zazzle item you can get the details with:
  #
  #   query = Razsell::Query.new.for_item_url('http://www.zazzle.com/some-item-354678976578865')
  #
  # Once you have built your query, use Razsell#request(query) to get the results.

  class Query
    include Razsell::SortMethods
    include Razsell::ImageSizes

    attr_accessor :page_limit
    attr_reader :artist

    def initialize *args
      set_default_page_limit

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
    
    def for_item_url url
      @item_url = url
      self.keywords = strip_item_number_from url
      self
    end

    def strip_item_number_from url
      url.scan(/\d*$/)[0]
    end

    def base_url
      return "http://feed.zazzle.com/#{@artist}/rss" if @artist
      "http://feed.zazzle.com/rss"
    end

    def to_querystring
      @querystring.to_a.map { |element| build_pair(element) }.sort {|first, second| first <=> second }.delete_if { |pair| pair == "" }.join("&")
    end

    def to_url
      "#{base_url}?#{to_querystring}"
    end

    def advance_page
      cur_page = @querystring[:page]
      return false if cur_page >= page_limit

      @querystring[:page] =  cur_page + 1
      true
    end

    private
      def build_pair pair
        key, value = pair
        return "" unless value
        
        "#{@keys[key]}=#{format_value(value)}"
      end

      def format_value value
        CGI.escape(value.to_s)
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
          end
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
