require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'razsell'

require 'mocha'

class Test::Unit::TestCase
  def feed name
    feed_file = File.open(File.join(File.dirname(__FILE__), 'fixtures', "#{name}.rss"), "r")
    feed = feed_file.read
    feed_file.close
    feed
  end
end

