@forums
Feature: Manage forums
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new forums
    Given I am on the new forums page
    And I press "Create"

  Scenario: Delete forums
    Given the following forums:
      ||
      ||
      ||
      ||
      ||
    When I delete the 3rd forums
    Then I should see the following forums:
      ||
      ||
      ||
      ||
