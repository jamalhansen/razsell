Feature: Query Image Link
  In order to get a link to an image of a product
  A user of razsell
  Will query a product image link

  Scenario: Querying the keyword Rockstar for the artist Kung Fu Tees
    Given a desire to query the artist "KungFuTees" on Zazzle
    When I query "rockstar"
    Then there should be "3" items
    And the items should have the keyword "Rockstar"
