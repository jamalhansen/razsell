Feature: Get Product Lines
  In order to better organize my products
  A user of razsell
  Will ask for a list of product lines

  Scenario: Getting all product lines for a user
    Given the artist "KungFuTees" on Zazzle
    When I ask for a list of the artists product lines
    Then I should get 3 lines
    And one should be named "Cheeze" with an id of "196854021783912655"
    And one should be named "New Products" with an id of "196596454716712290"
    And one should be named "Smim" with an id of "196983228798280961"

