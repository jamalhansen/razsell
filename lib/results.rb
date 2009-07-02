require 'hpricot'

module Razsell
  class Results
    attr_accessor :items

    def initialize feed
      populate_items feed
    end

    def populate_items feed
      doc = Hpricot::XML(feed)
      @items = []

    	doc.search("item").each do |item|
        @items << Razsell::Item.new(build_hash_from(item))
      end
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
  end
end
