Feature: Manage categories
  As an admin user
  in order to categorize blog articles
  I want to be able to assign categories to articles

  Background: The blog is set up
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: View the categories page
    When I follow "Categories"
    Then I should see "Title"
    And I should see "Description"
    And I should see "Permalink"
    And I should see "Keywords"

  Scenario: Create a new category
    When I follow "Categories"
    And I fill in "Name" with "Test"
    And I fill in "Keywords" with "test"
    And I fill in "Description" with "This is a test"
    And I press "Save"
    Then I should see "Test"
    And I should see "This is a test"
