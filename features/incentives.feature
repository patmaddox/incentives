Feature: Offering incentives
  In order to get our customers to spend more money
  Site producers will need to create incentives

  Scenario: Free shipping for order over $100
    Given an incentive named 'free shipping'
    And 'free shipping' is given for orders over $100
    And I have a cart
    When I add an item that costs $99 to my cart
    Then I should not qualify for 'free shipping'
    When I add an item that costs $2 to my cart
    Then I should qualify for 'free shipping'

  Scenario: 10% coupon when purchasing Gascans
    Given an item named 'Gascan'
    And an incentive named '10% coupon'
    And '10% coupon' is given for orders containing 'Gascan'
    When I add 'Gascan' to my cart
    Then I should qualify for '10% coupon'
