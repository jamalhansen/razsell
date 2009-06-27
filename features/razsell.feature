Feature: Query Image Link
  In order to get a link to an image of a product
  A user of razsell
  Will query a product image link

  Scenario: Querying the keyword Rockstar for the artist Kung Fu Tees
    Given an API key of "123456789012345678"
    When the "keyword" is "Rockstar"
    And the "artist" is "KungFuTees"
    And the "items_per_page" is "10"
    And I query "rockstar"
    Then there should be "3" results
    And there should be "1" page
    And the items should have the keyword "Rockstar"
