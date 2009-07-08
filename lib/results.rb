require 'hpricot'

module Razsell
  class Results
    attr_accessor :items, :result_count, :items_per_page

    def initialize feed
      @start_index = 0
      @items_per_page = 0
      @result_count = 0
      @items = []
      
      populate_items feed
    end

    def add feed
      populate_items feed
    end

    def item_count
      @items.length
    end

    def build_hash_from item
      item_hash = {}
      item_hash[:title] = strip_cdata(item.at("title").inner_html)
      item_hash[:guid] = item.at("guid").inner_html
      item_hash[:pub_date] = DateTime.parse(item.at("pubDate").inner_html)
      item_hash[:link] = item.at("link").inner_html
      item_hash[:author] = item.at("author").inner_html
      item_hash[:description] = strip_cdata(item.at("media:description").inner_html)
      item_hash[:thumbnail_url] = item.at("media:thumbnail")['url']
      item_hash[:content_url] = item.at("media:content")['url']
      item_hash[:keywords] = split_keywords(item.at("media:keywords").inner_html)
      item_hash[:rating] = item.at("media:rating").inner_html
      item_hash
    end

    def split_keywords words
      return [] if (!words || words == "")

      words.split(",").map { |s| s.strip }
    end

    def strip_cdata str
      str[9..-4]
    end

    def has_more_pages?
      return false unless (@start_index && @items_per_page && @result_count)
      (@start_index + @items_per_page) < @result_count
    end

    private
      def populate_items feed
        doc = Hpricot::XML(feed)
        rc = doc.at("opensearch:totalResults")
        ipp = doc.at("opensearch:itemsPerPage")
        si = doc.at("opensearch:startIndex")

        @result_count = rc.inner_html.to_i if rc
        @items_per_page = ipp.inner_html.to_i if ipp
        @start_index = si.inner_html.to_i if si

        doc.search("item").each do |item|
          @items << Razsell::Item.new(build_hash_from(item))
        end
      end
  end
end
