require 'hpricot'
require 'razsell/product_line'

module Razsell
  class ProductLineParser
    def parse document
      return [] unless document

      elements = get_elements document
      elements.map { |e| Razsell::ProductLine.new(e.attributes['href'] , e.inner_html) }
    end

    def get_elements document
      doc = Hpricot(document)

      (doc/"#page_module8/ul/li/a")
    end
  end
end
