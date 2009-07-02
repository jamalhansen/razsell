module Fixtures
  def feed name
    feed_file = File.open(File.join(File.dirname(__FILE__), 'fixtures', "#{name}.rss"), "r")
    feed = feed_file.read
    feed_file.close
    feed
  end
end
