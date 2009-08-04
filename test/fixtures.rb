module Fixtures
  def feed name
    filename = File.join(File.dirname(__FILE__), 'fixtures', "#{name}.rss")

    filename = File.join(File.dirname(__FILE__), 'fixtures', "#{name}.htm") unless File.exist? filename

    feed_file = File.open(filename, "r")
    feed = feed_file.read
    feed_file.close
    feed
  end
end
