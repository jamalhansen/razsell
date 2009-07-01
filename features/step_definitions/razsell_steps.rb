
Given /^a desire to query the artist "([^\"]*)" on Zazzle$/ do |artist|
  @artist = artist
  @sut = RazsellMixedIn.new
  @query = Razsell::Query.new.for_artist(artist)
end

When /^the "([^\"]*)" is "([^\"]*)"$/ do |name, value|
  @query.add_criteria(name, value)
end

When /^I query "([^\"]*)"$/ do |fixture|
  @result = @sut.request(@query)
end

Then /^there should be "([^\"]*)" items/ do |item_count|
  assert_equal item_count.to_i, @result.item_count
end

Then /^the items should have the keyword "([^\"]*)"$/ do |keyword|
  @result.items.each do |item|
    assert item.title.include? keyword
  end
end

