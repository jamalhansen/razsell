

module Razsell
  class Results
    attr_accessor :item_count, :items

    def initialize feed
      @feed = feed
      @item_count = 3
      @items = [Razsell::Item.new]
    end
  end
end
