Feature: Merge Articles
  As an admin user
  When authors write more than one article on the same topic
  I want to be able to merge two articles together

  Background: The blog is set up
    Given the blog is set up

    And the following articles exist:
      | id | title                           | author | user_id | published | body            |
      | 1  | An Article About Something      | joe    | 2       | true      | Something text  |
      | 2  | An Article About the Same Thing | mary   | 3       | true      | Same thing text |

    And the following users exist:
      | login | password | email                      | profile_id | name   | state  |
      #| admin | aaaaaaaa | admin@jonahlyngilstrap.com | 1          | admin  | active |
      | joe   | aaaaaaaa | joe@jonahlyngilstrap.com   | 2          | joe    | active |
      | mary  | aaaaaaaa | mary@jonahlyngilstrap.com  | 3          | mary   | active |

  Scenario: I should see both articles on the manage articles page
    Given I am logged into the admin panel as "admin"
    When I go to the manage articles page
    Then I should see "An Article About Something"
    And I should see "An Article About the Same Thing"

  Scenario: When I edit an article, I should see the Merge Articles form
    Given I am logged into the admin panel as "admin"
    When I go to the manage articles page
    And I follow "An Article About Something"
    Then I should see "Merge Articles"
    And I should see an element "#merge_with"

  Scenario: A non-admin cannot merge two articles
    Given I am logged into the admin panel as "joe"
    When I go to the manage articles page
    And I follow "An Article About Something"
    Then I should not see "Merge Articles"

  Scenario: When I create a new article I should not see the Merge Articles form
    Given I am logged into the admin panel as "admin"
    When I go to the manage articles page
    And I follow "New Article"
    Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel as "admin"
    When I go to the manage articles page
    And I follow "An Article About Something"
    And I fill in "merge_with" with the id of the "An Article About the Same Thing" article
    And I press "Merge"
    #Then I should see "An Article About Something"
    Then I should see "Something text"
    And I should see "Same thing text"









