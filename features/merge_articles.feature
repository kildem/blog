Feature: Article Merging
  As a blog administrator
  In order to better organize my articles
  I want to be able to merge articles of the same topic

  Background:
    Given the blog is set up
    And the following articles exist:
    | title     | author | body   | created_at          | published |
    | article 1 | admin  | text 1 | 2012-11-21 17:00:00 | true      |
    | article 2 | user   | text 2 | 2012-11-21 17:00:00 | true      |

  Scenario: Successfully merge articles
    And I am logged into the admin panel
    When I follow "All Articles"
    Then I should be on the admin content page
    Then I should see "article 2"
    And I should see "article 1"
    Then I follow "article 2"
    And I am on the details page for "article 2"
    Then I fill in "merge_with" with "1"
    And I press "Merge"
    And I should be on the admin content page
  
  Scenario: Non admin cannot merge articles
    Given I am logged into the user panel
    And I am on the details page for "article 2"
    Then I should not see "Merge"