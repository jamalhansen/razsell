
Given /^a desire to query the artist "([^\"]*)" on Zazzle$/ do |artist|
  @artist = artist
  @sut = RazsellMixedIn.new
  @query = Razsell::Query.new.for_artist(artist)
end

Given /^a desire to query a "([^\"]*)" item on Zazzle$/ do |fixture|
  @fixture = fixture
  @sut = RazsellMixedIn.new
  @query = Razsell::Query.new
end

When /^the "([^\"]*)" is "([^\"]*)"$/ do |name, value|
  @query.add_criteria(name, value)
end

When /^I query "([^\"]*)"$/ do |fixture|
  http_service = Razsell::HttpService.new
  http_service.expects(:get).once.returns(feed(fixture))

  @result = @sut.request(@query, :http_service => http_service)
end

When /^I query the link "([^\"]*)"$/ do |link|
  @query.for_item_url(link)
  http_service = Razsell::HttpService.new
  http_service.expects(:get).once.returns(feed(@fixture))
  
  @result = @sut.request(@query, :http_service => http_service)
end

Then /^there should be "([^\"]*)" item$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^there should be "([^\"]*)" items/ do |item_count|
  assert_equal item_count.to_i, @result.item_count
end

Then /^the items should have the keyword "([^\"]*)"$/ do |keyword|
  @result.items.each do |item|
    assert item.title.include? keyword
  end
end

Then /^the items should have a link to an image$/ do
  @result.items.each do |item|
    assert(/http:\/\/rlv.zcache.com\/.*\.jpg/ =~ item.content_url)
  end
end

Then /^the items should have a link to a thumbnail$/ do
  @result.items.each do |item|
    assert(/http:\/\/rlv.zcache.com\/.*\.jpg/ =~ item.thumbnail_url)
  end
end

