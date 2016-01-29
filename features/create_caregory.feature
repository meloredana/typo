Feature: Create Category
  As an admin
  In order add group articles by theme
  I want to be able to add and edit categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create a new category
    Given I am on the new category page
    When I fill in "category_name" with "Reviews"
    And I press "Save"
    Then I should see "Reviews"

  Scenario: Successfully edit a category
    Given I am on the new category page
    When I follow "Edit"
    And I fill in "category_description" with "Feedback"
    And I press "Save"
    Then I should see "Feedback"
