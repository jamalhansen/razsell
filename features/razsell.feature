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

  Scenario: Querying item information from an item url
    Given a desire to query a "rockstar_mug" item on Zazzle
    When I query the link "http://www.zazzle.com/rockstar_coder_mug-168427986526885635"
    Then there should be "1" items
    And the items should have the keyword "Rockstar"
    And the items should have the keyword "Coder"
    And the items should have the keyword "Mug"
    And the items should have a link to a thumbnail
