

module Razsell
  class Results
    attr_accessor :item_count, :page_count, :items

    def initialize
      @item_count = 3
      @page_count = 1
      @items = [Razsell::Item.new]
    end
  end
end
