Feature: Query Image Link
  In order to get a link to an image of a product
  A user of razsell
  Will query a product image link

  Scenario: Querying the keyword Rockstar for the artist Kung Fu Tees returns an image url
    Given a desire to query the artist "KungFuTees" on Zazzle
    When I query "rockstar"
    Then there should be "3" items
    And the items should have the keyword "Rockstar"
    And the items should have a link to an image

  Scenario: Querying the keyword Rockstar for the artist Kung Fu Tees returns a thumbnail url
    Given a desire to query the artist "KungFuTees" on Zazzle
    When I query "rockstar"
    Then there should be "3" items
    And the items should have the keyword "Rockstar"
    And the items should have a link to a thumbnail
