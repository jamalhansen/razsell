Given /^an API key of "([^\"]*)"$/ do |api_key|
  @api_key = api_key
  @sut = RazsellMixedIn.new
  @query = Razsell::Query.new
end

When /^the "([^\"]*)" is "([^\"]*)"$/ do |name, value|
  @query.add_criteria(name, value)
end

When /^I query "([^\"]*)"$/ do |fixture|
  @result = @sut.request(@query)
end

Then /^there should be "([^\"]*)" results$/ do |item_count|
  assert_equal item_count.to_i, @result.item_count
end

Then /^there should be "([^\"]*)" page$/ do |page_count|
  assert_equal page_count.to_i, @result.page_count
end

Then /^the items should have the keyword "([^\"]*)"$/ do |keyword|
  @result.items.each do |item|
    assert item.title.include? keyword
  end
end

