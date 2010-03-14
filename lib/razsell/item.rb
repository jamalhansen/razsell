module Razsell
  
  # Represents a single item returned in the rss feed
  class Item
    def initialize values={}
      @values = values
      self.class.class_eval do
        add_attributes values
      end
    end

    def self.add_attributes values
      values.each_key do |key|
        define_method "#{key.to_s}" do
          @values[key]
        end
      end
    end
    
    def to_hash
      @values.dup
    end
  end
end
