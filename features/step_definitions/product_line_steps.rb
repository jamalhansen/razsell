
Given /^the artist "([^\"]*)" on Zazzle$/ do |artist|
  @artist = artist
  @sut = RazsellMixedIn.new
end

When /^I ask for a list of the artists product lines$/ do
  http_service = Razsell::HttpService.new
  http_service.expects(:get).once.returns(feed("productlines"))

  @product_lines = @sut.product_lines_for(@artist, :http_service => http_service)
end

Then /^I should get 3 lines$/ do
  assert_equal 3, @product_lines.length
end

Then /^one should be named "([^\"]*)" with an id of "([^\"]*)"$/ do |name, id|
  @found = false

  @product_lines.each do |line|
    if line.id == id && line.name == name
      @found = true
    end
  end

  assert @found
end
